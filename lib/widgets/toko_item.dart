import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app/widgets/hadiah_item.dart';

class TokoItem extends StatelessWidget {
  const TokoItem({super.key});

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
                    Text("Nama Toko", style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Icon(Icons.pin_drop_outlined, color: Colors.white,size: 12,),
                        SizedBox(width: 6,),
                        Text("alamat toko", style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("status", style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.white, size: 12,),
                        SizedBox(width: 6,),
                        Text("+62123131231", style: TextStyle(color: Colors.white),)
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: HadiahItem(),
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