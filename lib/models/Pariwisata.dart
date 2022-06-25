class Pariwisata {
  final int wisataID;
  final String nama;
  final String deskripsi;
  final String lokasi;
  final int harga;
  // final double rating;
  final int kategoriID;
  final String urlGambar;

  const Pariwisata(
      {required this.wisataID,
      required this.nama,
      required this.deskripsi,
      required this.lokasi,
      required this.harga,
      // required this.rating,
      required this.kategoriID,
      required this.urlGambar});
  factory Pariwisata.fromJson(Map<String, dynamic> json) {
    return Pariwisata(
        wisataID: json['wisataID'],
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        lokasi: json['lokasi'],
        harga: json['harga'],
        // rating: json['rating'],
        kategoriID: json['kategoriID'],
        urlGambar: json['urlGambar']);
  }
}
