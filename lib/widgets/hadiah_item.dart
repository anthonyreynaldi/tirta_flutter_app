import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app/models/hadiah_model.dart';

class HadiahItem extends StatelessWidget {
  final Hadiah hadiah;
  const HadiahItem({super.key, required this.hadiah});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1ca39d), borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.card_giftcard_rounded, color: Colors.white, size: 16,),
            SizedBox(width: 6,),
            Text(hadiah.kode, style: TextStyle(color: Colors.white, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}