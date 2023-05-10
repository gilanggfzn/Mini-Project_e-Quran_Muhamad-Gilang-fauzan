import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_quran/model/detail_surah_model.dart';
import 'package:e_quran/model/list_surah_model.dart';

class QuranAPI {
  Future<ListSurahResponse> getsurah() async {
    final response = await Dio().get(
        "https://equran.id/api/v2/surat",);

    return ListSurahResponse.fromJson(response.data);
  }


  //Detail SUrah
 Future<DetailSurahResponse> getDetailSurah(
    String noSurah,
  ) async{
    final response = await Dio().get(
        "https://equran.id/api/v2/surat/$noSurah",
        );
        print(response);

        return DetailSurahResponse.fromJson(response.data);
  }

}

