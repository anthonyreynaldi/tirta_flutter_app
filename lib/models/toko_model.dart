import 'dart:convert';

import 'package:flutter_app/models/hadiah_model.dart';
import 'package:flutter_app/global.dart' as Global;

class Toko {
  String id;
  String nama;
  String alamat;
  String telp;
  List<Hadiah> listHadiah;

  Toko({required this.id, required this.nama, required this.alamat, required this.telp, required this.listHadiah});

  factory Toko.fromJson(Map<String, dynamic> json) {
    List<Hadiah> tempHadiah = [];

    for (var hadiah in json['hadiah']) {
      tempHadiah.add(Hadiah.fromJson(hadiah));
    }

    return Toko(
      id: json['id'],
      nama: json['nama'],
      alamat: json['alamat'],
      telp: json['telp'],
      listHadiah: tempHadiah,
    );
  }

  static Future<List> all() async {
    print("send get");
    var jsonResult = await Global.sendGet(Global.api_url+"/toko");

    var tempToko = [];
    for (var toko in jsonResult) {
      tempToko.add(Hadiah.fromJson(toko));
    }

    return tempToko;
  }

  static allDummy() async {
    var data = '''[
              {
                "id": "9cb9f089-afa0-4b01-9c49-af88e01733de",
                "nama": "Bintang Mandiri",
                "alamat": "Tengku Istkandar",
                "telp": "+6223423423498",
                "hadiah": [
                  {
                    "id": "01j4w2mnkctndtax8f663v5cry",
                    "tipe_hadiah_id": "01j4w2mnjj59dvy2ddejza4a9w",
                    "toko_id": "9cb9f089-afa0-4b01-9c49-af88e01733de",
                    "kode": "TTOL-OOA-23-06-00001",
                    "penerimaan": "1",
                    "tgl_penerimaan": "2024-05-22 14:34:01",
                    "alasan_tolak": "gaada org sdfsdfsdf",
                    "tipe_hadiah": {
                      "id": "01j4w2mnjj59dvy2ddejza4a9w",
                      "nama": "Emas 0,5 Gr",
                      "satuan": "Buah"
                    }
                  }
                ]
              },
              {
                "id": "9cb9f089-b3b5-4067-80b9-ff2ab58874af",
                "nama": "Mandiri Baru",
                "alamat": "T Inskandar",
                "telp": "+6937223423498",
                "hadiah": [
                  {
                    "id": "01j4w2mnkfm33n45bc32qyds0q",
                    "tipe_hadiah_id": "01j4w2mnjj59dvy2ddejza4a9w",
                    "toko_id": "9cb9f089-b3b5-4067-80b9-ff2ab58874af",
                    "kode": "TTOL-OOA-23-06-00002",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjj59dvy2ddejza4a9w",
                      "nama": "Emas 0,5 Gr",
                      "satuan": "Buah"
                    }
                  },
                  {
                    "id": "01j4w2mnkjxr83zx0kvrdamat7",
                    "tipe_hadiah_id": "01j4w2mnjqtdkc6wdp6ys1vsja",
                    "toko_id": "9cb9f089-b3b5-4067-80b9-ff2ab58874af",
                    "kode": "TTOL-OOA-23-06-00003",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjqtdkc6wdp6ys1vsja",
                      "nama": "Emas 5 Gr",
                      "satuan": "Buah"
                    }
                  }
                ]
              },
              {
                "id": "9cb9f089-b4a8-4a46-b01d-c4644c5d1262",
                "nama": "Mirza",
                "alamat": "Tengku Iskandar",
                "telp": "+6223491583498",
                "hadiah": [
                  {
                    "id": "01j4w2mnkmp0apk7zjdsn2wwpx",
                    "tipe_hadiah_id": "01j4w2mnjtfdf1mr4vn49csttp",
                    "toko_id": "9cb9f089-b4a8-4a46-b01d-c4644c5d1262",
                    "kode": "TTOL-OOA-23-06-00004",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjtfdf1mr4vn49csttp",
                      "nama": "Voucher 50rb",
                      "satuan": "Lembar"
                    }
                  },
                  {
                    "id": "01j4w2mnkp8t41wyz94prm5bza",
                    "tipe_hadiah_id": "01j4w2mnjn5805xfnansq0978q",
                    "toko_id": "9cb9f089-b4a8-4a46-b01d-c4644c5d1262",
                    "kode": "TTOL-OOA-23-06-00005",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjn5805xfnansq0978q",
                      "nama": "Emas 1 Gr",
                      "satuan": "Buah"
                    }
                  }
                ]
              },
              {
                "id": "9cb9f089-b593-47c0-bbc4-c80d2c1a6081",
                "nama": "Puga Jaya",
                "alamat": "Kebun Raya",
                "telp": "+6223429015498",
                "hadiah": [
                  {
                    "id": "01j4w2mnkr0wyg73hxzq0z50fp",
                    "tipe_hadiah_id": "01j4w2mnjqtdkc6wdp6ys1vsja",
                    "toko_id": "9cb9f089-b593-47c0-bbc4-c80d2c1a6081",
                    "kode": "TTOL-OOA-23-06-00006",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjqtdkc6wdp6ys1vsja",
                      "nama": "Emas 5 Gr",
                      "satuan": "Buah"
                    }
                  },
                  {
                    "id": "01j4w2mnkvjnysb5sp94p53trm",
                    "tipe_hadiah_id": "01j4w2mnjx9xdcv7pn8qawyc2w",
                    "toko_id": "9cb9f089-b593-47c0-bbc4-c80d2c1a6081",
                    "kode": "TTOL-OOA-23-06-00007",
                    "penerimaan": null,
                    "tgl_penerimaan": null,
                    "alasan_tolak": null,
                    "tipe_hadiah": {
                      "id": "01j4w2mnjx9xdcv7pn8qawyc2w",
                      "nama": "Voucher 100rb",
                      "satuan": "Lembar"
                    }
                  }
                ]
              }
            ]''';
    return jsonDecode(data);
  }
}