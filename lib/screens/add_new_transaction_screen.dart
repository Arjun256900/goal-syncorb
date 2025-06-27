import 'package:flutter/material.dart';
import 'package:goal/widgets/add_container.dart';
import 'package:goal/widgets/custom_text_field.dart';
import 'package:goal/widgets/dropDownField.dart';

class AddNewTransactionScreen extends StatelessWidget {
  const AddNewTransactionScreen({super.key});

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
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                  label: const Text("Debit"),
                  icon: const Icon(Icons.arrow_downward),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: const Text("Credit"),
                  icon: const Icon(Icons.arrow_upward),
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
            AddContainer(
              subtext: "Select the suitable document for upload here",
              isGoal: false,
              isUpload: true,
            ),
            const SizedBox(height: 35),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ), // 10% margins
              child: Row(
                children: [
                  // Undo Button
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black87,
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
                      onPressed: () {},
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
