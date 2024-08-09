import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomSelect extends StatefulWidget {
  final List<String> options;
  final Function onUpdate;

  const CustomSelect({super.key, required this.options, required this.onUpdate});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  var _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: MediaQuery.of(context).size.width * 0.55,
      initialSelection: "",              
      dropdownMenuEntries: widget.options.map((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
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