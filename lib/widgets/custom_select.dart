import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app/models/toko_model.dart';

class CustomSelect extends StatefulWidget {
  final List<dynamic> options;
  final Function onUpdate;

  const CustomSelect({super.key, required this.options, required this.onUpdate});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  var _selectedItem = "";
  @override
  void initState() {
    super.initState();
    widget.options.insert(0, Toko(id: "ALL", nama: "Semua Toko", alamat: "", telp: "", listHadiah: []));
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: MediaQuery.of(context).size.width * 0.55,
      initialSelection: "",              
      dropdownMenuEntries: widget.options.map((toko) {
        return DropdownMenuEntry<String>(
          value: toko.id,
          label: toko.nama,
        );
      }).toList(),
      onSelected: (newValue) {
        setState(() {
          _selectedItem = newValue!;
        });

        widget.onUpdate(newValue);
      }
    );
  }
}