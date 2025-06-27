import 'package:flutter/material.dart';

class Dropdownfield extends StatefulWidget {
  final  List<String> items;
  final String hintText;
  const Dropdownfield({super.key,required this.items,required this.hintText});

  @override
  State<Dropdownfield> createState() => _DropdownfieldState();
}

class _DropdownfieldState extends State<Dropdownfield> {
String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      hint: Text(widget.hintText),
      items:
              widget.items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
    icon: const Icon(Icons.keyboard_arrow_down),
    onChanged:(String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
     } ,
    );
  }
}