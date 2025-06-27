import 'package:flutter/material.dart';
import 'package:goal/widgets/custom_text_field.dart';

class AddNewGoal extends StatelessWidget {
  const AddNewGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Goal",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color(0xFFF0F0F0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                heading: "Goal Name",
                hintText: "Enter your Goal Name",
              ),
              const SizedBox(height: 8),
              CustomTextField(
                heading: "Target Amount",
                hintText: "How much do you want to save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
