import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String heading;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.heading,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 4),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 54),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFF0000004D),fontSize: 14,),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder( 
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Color(0xff00000066)), 
    ),
    focusedBorder: OutlineInputBorder( 
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
            ),
          ),
        ),
      ],
    );
  }
}
