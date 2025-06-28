import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:goal/widgets/add_container.dart';
import 'package:goal/widgets/custom_text_field.dart';
import 'package:goal/widgets/dropDownField.dart';
import 'package:goal/widgets/file_picker.dart';

class AddNewTransactionScreen extends StatefulWidget {
  const AddNewTransactionScreen({super.key});

  @override
  State<AddNewTransactionScreen> createState() =>
      _AddNewTransactionScreenState();
}

class _AddNewTransactionScreenState extends State<AddNewTransactionScreen> {
  bool isDebit = true;
  void setType() {
    setState(() {
      isDebit = !isDebit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F0F0),
        title: const Text(
          "Add Transaction",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Transaction type"),
            Row(
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: isDebit
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),

                  onPressed: () {
                    if (isDebit) return;
                    setType();
                  },
                  label: Text(
                    "Debit",
                    style: TextStyle(
                      color: isDebit ? Colors.white : Colors.black,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_downward,
                    color: isDebit ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: !isDebit
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    if (!isDebit) return;
                    setType();
                  },
                  label: Text(
                    "Credit",
                    style: TextStyle(
                      color: !isDebit ? Colors.white : Colors.black,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_upward,
                    color: !isDebit ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Dropdownfield(
              items: ["Cash", "Online"],
              hintText: "Cash",
              heading: "Source selection",
            ),
            const SizedBox(height: 10),
            CustomTextField(heading: "Amount", hintText: "Enter Amount"),
            const SizedBox(height: 10),
            CustomTextField(
              heading: "Date",
              hintText: "Select Date Of Transaction",
            ),
            const SizedBox(height: 10),
            Dropdownfield(
              items: ["Food", "Others"],
              hintText: "Eg: Food",
              heading: "Category",
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Upload bill",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                const SizedBox(width: 4),
                const Text(
                  "(Optional)",
                  style: TextStyle(fontSize: 11, color: Color(0xFF000000)),
                ),
              ],
            ),
            const SizedBox(height: 7),
            FilePickerWidget(
              subtext: "Select the suitable document for upload here",
            ),
            const SizedBox(height: 35),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // Undo Button
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFE6E6E6),
                        foregroundColor: Colors.black87,
                        side: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          width: 0.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Undo'),
                    ),
                  ),
                  const SizedBox(width: 16), // spacing between buttons
                  // Save Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
