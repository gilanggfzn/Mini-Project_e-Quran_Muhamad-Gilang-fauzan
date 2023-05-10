import 'package:e_quran/model/api/quran_api.dart';
import 'package:e_quran/screen/bookmark_surah_screen.dart';
import 'package:e_quran/screen/detail_surah_screen.dart';
import 'package:e_quran/screen/login_screen.dart';
import 'package:e_quran/utils/shared_preferences.dart';
import 'package:flutter/material.dart';


class ListSurahScreen extends StatefulWidget {
  const ListSurahScreen({super.key});

  @override
  State<ListSurahScreen> createState() => _ListSurahScreenState();
}

class _ListSurahScreenState extends State<ListSurahScreen> {
  String _username = "";
  String _password = "";

  void initial() async {
    _username = await getValue(keyToken);
    _password = await getValue(keyPassword);
    print(_username);
    setState(() {});
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 96, 235, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 106, 241, 158),
        title: Row(
          children: const[
             SizedBox(
              width: 30,
            ),
             Text(
              'Selamat Membaca E-Quran',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookmarkScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark,size: 25,color: Colors.black,),),
                 IconButton(onPressed: (){
                 Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                    ), 
                    (route) => false);
                  RemoveToken(keyToken);
                 }, 
                 icon: const Icon(Icons.logout_sharp,size: 25, color: Colors.black,))
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: QuranAPI().getsurah(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final quran = snapshot.data;
            return ListView.builder(
              itemCount: quran?.data.length,
              itemBuilder: (context, index) {
                var data = quran?.data[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailSurahScreen(
                        noSurah: data?.nomor.toString() ?? "",
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Text(
                      data?.nomor.toString() ?? "",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    title: Text(
                      data?.namaLatin ?? "",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          data?.jumlahAyat.toString() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(data?.tempatTurun.toString() ?? ""),
                      ],
                    ),
                    trailing: Text(
                      data?.nama ?? "",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    shape: const Border(
                      bottom: BorderSide(width: 2),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('snapshot error'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
