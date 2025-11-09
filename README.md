# FlutterApp

Uygulamada film (IMDb), haber ve döviz kuru verilerini **public API’ler** üzerinden çekip kullanıcıya sade, modern ve anlaşılır bir arayüzle sunuyor.  
Amacım farklı veri kaynaklarından veri çekmeyi, bu verileri modele dönüştürüp ekranda listelemeyi ve kullanıcı etkileşimiyle yönetmeyi pratik olarak göstermekti.

---

## Özellikler

- IMDb API üzerinden film arama ve listeleme işlemleri yapılıyor.  
  Kullanıcı film adını yazarak arama yapabiliyor ve detay sayfasında seçilen filme ait bilgilere ulaşabiliyor.

- Güncel haberler News API üzerinden çekiliyor.  
  Her haberin başlığı, açıklaması, görseli ve kaynak bilgisi gösteriliyor.

- Döviz kurları Finance API ile dinamik olarak getiriliyor.  
  Kullanıcı baz para birimine göre farklı kurları anlık olarak görebiliyor.

- Tüm veriler modele dönüştürülerek UI üzerinde gösteriliyor.  
  State yönetimi temiz bir yapıda tutuldu.

- Kod yapısı genel olarak sade, modüler ve okunabilir olacak şekilde düzenlendi.

---

## Kullanılan Teknolojiler

- **Flutter & Dart**  
- **HTTP package** (API istekleri için)  
- **Dio** (veri çekme işlemlerinde)  
- **Material Design** arayüz tasarımı  
- **Model–View** yapısı  
- **Stateful / Stateless Widget** kullanımı  
- Modüler dosya yapısı (components, models, screens, services, utils)

---

## Kurulum

Projeyi kendi bilgisayarında çalıştırmak istersen:

cd FlutterApp /
flutter pub get /
flutter run



