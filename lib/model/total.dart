class Total {
  int? jumlahPositif;
  int? jumlahDirawat;
  int? jumlahSembuh;
  int? jumlahMeninggal;

  Total(
      {this.jumlahPositif,
      this.jumlahDirawat,
      this.jumlahSembuh,
      this.jumlahMeninggal});

  factory Total.addTotal(Map<String, dynamic> object) {
    return Total(
        jumlahPositif: object['jumlah_positif'],
        jumlahDirawat: object['jumlah_dirawat'],
        jumlahSembuh: object['jumlah_sembuh'],
        jumlahMeninggal: object['jumlah_meninggal']);
  }
}
