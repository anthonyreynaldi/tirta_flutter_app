import 'package:flutter/material.dart';
import 'package:flutter_app/models/toko_model.dart';
import 'package:flutter_app/widgets/custom_select.dart';
import 'package:flutter_app/widgets/toko_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listToko = [];
  var selectedToko = "ALL";

  Future<dynamic> getTokoData() async {
    await Toko.all().then((value) => {
        listToko = value
    });
    return listToko;
  }

  void updateSelectedToko(newToko) {
      setState(() {
        selectedToko = newToko;
      });
      print(selectedToko);
  }

  void showRekapTotalHadiah(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Hadiah"),
            Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFF00887a),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        content: Container(
          child: Column(
            children: [
              Divider(thickness: 4,),
              
              Divider(thickness: 4,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Flutter Tirta',
      routes: {

      },
      home: Scaffold(
        body: FutureBuilder(
          future: getTokoData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(child: Text('Tidak Ada Data'));
            }

            return Container(
              child: Column(
                children: [
                  //head and filter
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //select toko
                        CustomSelect(options: listToko, onUpdate: updateSelectedToko),

                        SizedBox(width: 16,),

                        //check total hadiah
                        ElevatedButton.icon(
                          onPressed: showRekapTotalHadiah, 
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.card_giftcard_rounded),
                          ) , 
                          label: Text("Total Hadiah"))
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [ 
                          for(var toko in listToko)
                            if (toko.id == selectedToko || selectedToko == "ALL")
                              TokoItem(toko: toko,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        )
        
      )
    );
  }
}