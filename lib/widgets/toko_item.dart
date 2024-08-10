import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app/models/toko_model.dart';
import 'package:flutter_app/widgets/hadiah_item.dart';

class TokoItem extends StatelessWidget {
  final Toko toko;
  const TokoItem({super.key, required this.toko});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF00887a),
      child: Column(
        children: [
          //keterangan toko
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(toko.nama, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Icon(Icons.pin_drop_outlined, color: Colors.white,size: 12,),
                        SizedBox(width: 6,),
                        Text(toko.alamat, style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(toko.id, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.white, size: 12,),
                        SizedBox(width: 6,),
                        Text(toko.telp, style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          //detail hadiah
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))),
            child:
             Column(
              children: [
                SizedBox(height: 16,),
                for(var hadiah in toko.listHadiah)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                    child: HadiahItem(hadiah: hadiah,),
                  ),
                
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: (){}, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Terima Hadiah"),
                  )
                ),
                SizedBox(height: 32,),
              ],
            ),
          )
        ],
      ),
    );
  }
}