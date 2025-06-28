import 'package:flutter/material.dart';

class Dropdownfield extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final String heading;
  final ValueChanged<String> onChanged;
  // final String SelectedValue;
  const Dropdownfield({
    super.key,
    required this.items,
    required this.hintText,
    required this.heading,
    required this.onChanged,
  });

  @override
  State<Dropdownfield> createState() => _DropdownfieldState();
}

class _DropdownfieldState extends State<Dropdownfield> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 4),

        Container(
          height: 54.0,
          width: 380.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.3), width: 0.5),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton(
                dropdownColor: Colors.white,
                value: selectedValue,
                hint: Text(widget.hintText),
                style: TextStyle(fontSize: 14, color: Colors.black),
                items: widget.items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedValue = newValue;
                    });
                    widget.onChanged(newValue); // Dispatch to BLoC or parent
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
