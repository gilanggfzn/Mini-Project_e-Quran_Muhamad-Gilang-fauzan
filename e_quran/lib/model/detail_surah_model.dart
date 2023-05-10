// To parse this JSON data, do
//
//     final detailSurahResponse = detailSurahResponseFromJson(jsonString);

import 'dart:convert';

DetailSurahResponse detailSurahResponseFromJson(String str) => DetailSurahResponse.fromJson(json.decode(str));

String detailSurahResponseToJson(DetailSurahResponse data) => json.encode(data.toJson());

class DetailSurahResponse {
    DetailSurahResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory DetailSurahResponse.fromJson(Map<String, dynamic> json) => DetailSurahResponse(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.ayat,
        required this.suratSelanjutnya,
    });

    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;
    String tempatTurun;
    String arti;
    String deskripsi;
    Map<String, String> audioFull;
    List<Ayat> ayat;
    SuratSenya suratSelanjutnya;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: SuratSenya.fromJson(json["suratSelanjutnya"]),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya.toJson(),
    };
}

class Ayat {
    Ayat({
        required this.nomorAyat,
        required this.teksArab,
        required this.teksLatin,
        required this.teksIndonesia,
        required this.audio,
    });

    int nomorAyat;
    String teksArab;
    String teksLatin;
    String teksIndonesia;
    Map<String, String> audio;

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class SuratSenya {
    SuratSenya({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
    });

    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;

    factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
    };
}
