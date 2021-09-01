class Harian {
  String? keyAsString;
  int? jumlahMeninggal;
  int? jumlahSembuh;
  int? jumlahPositif;
  int? jumlahDirawat;

  Harian(
      {this.keyAsString,
      this.jumlahMeninggal,
      this.jumlahSembuh,
      this.jumlahPositif,
      this.jumlahDirawat});

  factory Harian.addHarian(Map<String, dynamic> object) {
    return Harian(
      keyAsString: object['key_as_string'],
      jumlahMeninggal: object['jumlah_meninggal']['value'],
      jumlahSembuh: object['jumlah_sembuh']['value'],
      jumlahPositif: object['jumlah_positif']['value'],
      jumlahDirawat: object['jumlah_dirawat']['value'],
    );
  }
}
