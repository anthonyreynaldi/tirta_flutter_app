import 'package:flutter_app/models/tipe_hadiah_model.dart';

class Hadiah {
  String id;
  String kode;
  int penerimaan;
  String tglPenerimaan;
  String alasanTolak;
  TipeHadiah tipeHadiah;

  Hadiah({required this.id, required this.kode, required this.penerimaan, required this.tglPenerimaan, required this.alasanTolak, required this.tipeHadiah});

  factory Hadiah.fromJson(Map<String, dynamic> json) {

    return Hadiah(
      id: json['id'],
      kode: json['kode'],
      penerimaan: json['penerimaan'],
      tglPenerimaan: json['tglPenerimaan'],
      alasanTolak: json['alasanTolak'],
      tipeHadiah: TipeHadiah.fromJson(json['tipeHadiah']),
    );
  }
}