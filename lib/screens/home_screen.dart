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
  var selectedToko = "";

  getTokoData() async {
    print("masok");
      await Toko.all().then((value) => {
        setState(() {
          print("selese");
          listToko = value;
        })
      });
  }

  void updateSelectedToko(newToko) {
    setState(() {
      selectedToko = newToko;
      print(selectedToko);
    });
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
            } else if (!snapshot.hasData) {
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
                        CustomSelect(options: ["a", "b", "c"], onUpdate: updateSelectedToko),

                        SizedBox(width: 16,),

                        //check total hadiah
                        ElevatedButton.icon(
                          onPressed: (){}, 
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
                          TokoItem(),
                          TokoItem(),
                          TokoItem(),
                          TokoItem(),
                          TokoItem(),
                          
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