class TipeHadiah {
  String id;
  String nama;
  String satuan;

  TipeHadiah({required this.id, required this.nama, required this.satuan});

  factory TipeHadiah.fromJson(Map<String, dynamic> json) {

    return TipeHadiah(
      id: json['id'],
      nama: json['nama'],
      satuan: json['satuan'],
    );
  }
}