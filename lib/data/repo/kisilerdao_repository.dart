import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRepository{
  Future<void> kaydet (String kisi_ad,String kisi_tel) async {
    print("Kişi kaydet : $kisi_ad - $kisi_tel");
  }
  Future<void> guncelle (int kisi_id,String kisi_ad,String kisi_tel) async {
    print("Kişi güncelle: $kisi_id $kisi_ad - $kisi_tel");
  }
  Future<void> sil(int kisi_id) async {
    print("Kişi Sil : $kisi_id");

  }
  Future<List<Kisiler>> kisileriYukle( ) async {
    var kisilerListe = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Telli", kisi_tel: "111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Eray", kisi_tel: "222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Emir", kisi_tel: "333");
    var k4 = Kisiler(kisi_id: 4, kisi_ad: "Rıdvan", kisi_tel: "444");
    var k5 = Kisiler(kisi_id: 5, kisi_ad: "Enes", kisi_tel: "555");
    var k6 = Kisiler(kisi_id: 6, kisi_ad: "Furki", kisi_tel: "666");
    kisilerListe.add(k1);
    kisilerListe.add(k2);
    kisilerListe.add(k3);
    kisilerListe.add(k4);
    kisilerListe.add(k5);
    kisilerListe.add(k6);
    return kisilerListe;
  }
  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisilerListe = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Telli", kisi_tel: "111");

    kisilerListe.add(k1);

    return kisilerListe;

  }
}