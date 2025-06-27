import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  final String heading;
  final String hintText;
  const DateField({super.key, required this.heading, required this.hintText});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _controller.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/"
            "${pickedDate.month.toString().padLeft(2, '0')}/"
            "${pickedDate.year}";
      });
    }
  }

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

        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 54),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 0, 0, 0.3),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  width: 0.5,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Color.fromRGBO(3, 150, 157, 0.09),
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: Color.fromRGBO(1, 86, 90, 1),
                  ),
                ),
              ),
            ),
            onTap: () => _selectDate(context),
          ),
        ),
      ],
    );
  }
}
