import 'package:flutter/material.dart';

/// A reusable text input field that dispatches changes via [onChanged].
/// Removed internal controller to prevent rebuild issues—uses [initialValue] instead.
class CustomTextField extends StatelessWidget {
  final String heading;
  final String hintText;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.heading,
    required this.hintText,
    this.initialValue = '',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 54),
          child: TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
