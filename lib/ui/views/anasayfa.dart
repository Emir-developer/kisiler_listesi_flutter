import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  Future<void> ara(String aramaKelimesi) async {
    print("Kişi Ara : $aramaKelimesi");

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
  Future<void> sil(int kisi_id) async {
    print("Kişi Sil : $kisi_id");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            ara(aramaSonucu);
          },
        ):
        const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });

          }, icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context,indeks){
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(kisi: kisi)))
                        .then((value ){
                      print("Anasayfaya geri dönüldü.");
                    });
                  },
                  child: Card(
                    child: SizedBox( height: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad,style: const TextStyle(fontSize: 20),),
                                Text(kisi.kisi_tel),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${kisi.kisi_ad} silinsin mi ? "),
                                    action: SnackBarAction(label: "Evet", onPressed: (){
                                      sil(kisi.kisi_id);
                                    }),
                                ),
                            );
                          }, icon: const Icon(Icons.clear,color: Colors.black54,),) ,
                        ],
                      ),
                    ),
                  ),
                );
                },
            );
          }else{
            return const Center();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value ){
                print("Anasayfaya geri dönüldü.");
          });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
