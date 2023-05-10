import 'package:e_quran/db/database_helper.dart';
import 'package:e_quran/model/api/quran_api.dart';
import 'package:e_quran/model/bookmark_surah_table.dart';
import 'package:e_quran/model/detail_surah_model.dart';
import 'package:e_quran/model/list_surah_model.dart';
import 'package:flutter/material.dart';


class DetailSurahScreen extends StatefulWidget {
  final String noSurah;
  const DetailSurahScreen({
    super.key,
    required this.noSurah,
  });

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  bool _isInsert = false;

  BookmarkTable? _bookmarkTable = BookmarkTable(
    nomor: -1, 
    namaLatin: "", 
    jumlahAyat: "");

  void getStatusBookmark () async {
    _bookmarkTable = await DatabaseHelper().getStatusBookmark(
      int.parse(
        widget.noSurah
      ),
    );
    if (_bookmarkTable != null) {
      _isInsert = true;
    }
  }

  @override
  void initState() {
    getStatusBookmark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: QuranAPI().getDetailSurah(widget.noSurah),
      builder: (context, snapshot){
          if (snapshot.hasData) {
            final surah = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data?.data.namaLatin ?? ""),
                centerTitle: true,
                actions: [
          IconButton(
              onPressed: ()  async {
                if (_isInsert == true) {
                  _isInsert = false;
                  DatabaseHelper().removeBookmark(
                    surah?.data.nomor ?? -1
                  );
                }else{
                  _isInsert = true;
                  DatabaseHelper().insertBookmark(
                    BookmarkTable(
                      nomor: surah?.data.nomor ?? -1,
                      namaLatin: surah?.data.namaLatin ?? "",
                      jumlahAyat: surah?.data.jumlahAyat.toString() ?? ""
                    ),);
                }
                setState(() {});  
              },
              icon: _isInsert == true
              ? const Icon(Icons.delete)
              : const Icon(Icons.bookmark_add_sharp,size: 35,),
              )
        ],
              ),

              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemBuilder: (context, index) => _ayatitem(ayat: surah!.data.ayat.elementAt(index)), 
                  itemCount: surah?.data.ayat.length),


              ),
            );
            
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
    },);
  }

  Widget _ayatitem({required Ayat ayat}) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 15,),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 117, 224, 121)
          ,borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Row(
          children: [
            const Text(""),
            Container(
              height: 30,width: 30,decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("${ayat.nomorAyat}",style: const TextStyle(fontWeight: FontWeight.w600),)),
            ),
          ],
        ),
      ),
    Text(
    ayat.teksArab,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 26),textAlign: TextAlign.right,
  ),
  const SizedBox(height: 15,),
  Text(ayat.teksIndonesia,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 16),textAlign: TextAlign.left,),
  const SizedBox(height: 15,),
  ],);
        
}
