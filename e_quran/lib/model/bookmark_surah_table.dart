class BookmarkTable {
  final int nomor;
  final String namaLatin;
  final String jumlahAyat;

  BookmarkTable({
    required this.nomor, 
    required this.namaLatin, 
    required this.jumlahAyat
    });

   factory BookmarkTable.fromMap(Map<String, dynamic> map) => BookmarkTable(
        nomor: map["nomor"],
        namaLatin: map["namaLatin"],
        jumlahAyat: map["jumlahAyat"],
    );
  
  Map<String, dynamic> toMap() => {
    "nomor" :nomor,
    "namaLatin" :namaLatin,
    "jumlahAyat" :jumlahAyat,
  };
}