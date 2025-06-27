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
              hintStyle: TextStyle(color:Color.fromRGBO(0, 0, 0, 0.3), fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.4),width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3), width: 0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
