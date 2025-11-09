import 'package:flutter/material.dart';
import 'package:my_app/components/Layout/ListLayout.dart';
import 'package:my_app/components/Layout/MainLayout.dart';
import 'package:my_app/models/finance_model.dart';
import 'package:my_app/services/api/finance_serviceApi.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<FinanceModel> financeData = [];
  List<FinanceModel> filteredData = [];
  @override
  void initState() {
    FinanceServiceApi()
        .getFinance()
        .then(
          (value) => setState(() {
            financeData.clear();
            financeData.addAll(value);
            filteredData.addAll(value);
            // print('--->financeData length: ${financeData.length}');
            // print('--->financeData first: ${financeData.first.code}');
          }),
        )
        .catchError((error) {
          print('Hata: $error');
        });
    super.initState();
  }

  void searchFunc(String query) {
    final searchLower = query.toLowerCase();

    setState(() {
      filteredData = financeData.where((item) {
        //where JS filtered gibi
        final code = item.code.toLowerCase();
        final name = item.name.toLowerCase();
        return code.contains(searchLower) ||
            name.contains(searchLower); //contains JS includes gibi
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Finans',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              onChanged: searchFunc,
              decoration: InputDecoration(
                hintText: 'Ara...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 1.2),
                ),
              ),
            ),
          ),
          Expanded(
            child: Listlayout(
              itemCount: filteredData.length,
              title: filteredData.map((e) => '${e.code}-${e.name}').toList(),
              subtitle: filteredData
                  .map((e) => '1 USD = ${e.rate.toStringAsFixed(2)} ${e.code}')
                  .toList(),
              data: financeData,
            ),
          ),
        ],
      ),

      currentIndex: 1,
    );
  }
}
