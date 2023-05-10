import 'package:e_quran/db/database_helper.dart';
import 'package:e_quran/screen/detail_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bookmark'),
        ),
        body: FutureBuilder(
          future: DatabaseHelper().getListSurahBookmark(),
          builder: (context, snapshot) {
           if (snapshot.hasData) {
            var data = snapshot.data;
              return data?.isEmpty == true
              ? const Center(child: Text("Bookmark Kosong"),)
              : ListView.builder(
                itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Column(
                      children: [
                        Text("Surah ke"),
                        Text(data?[index].nomor.toString() ?? ""),
                      ],
                    ),
                    title: Text(data?[index].namaLatin ?? ""),
                    subtitle: Row(
                      children: [
                        Text("Jumlah Ayat "),
                        Text(data?[index].jumlahAyat.toString() ?? ""),
                      ],
                    ),
                    ),
                );
              },
            );
           }
           return Text("Tidak Ada Bookmark");
          },
        ));
  }
}
