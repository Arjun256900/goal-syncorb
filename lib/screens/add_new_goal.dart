import 'package:flutter/material.dart';
import 'package:goal/widgets/custom_text_field.dart';
import 'package:goal/widgets/dateField.dart';
import 'package:goal/widgets/dropDownField.dart';

class AddNewGoal extends StatelessWidget {
  const AddNewGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Add New Goal",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color(0xFFF0F0F0),
        ),
        body: SafeArea(
          
          child: SingleChildScrollView(
            
            child: Padding(
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
                  const SizedBox(height: 8),
                  DateField(
                    heading: "Target Date",
                    hintText: "Select Target Date(eg.6 months from now)",
                  ),
                  const SizedBox(height: 8),
                  Dropdownfield(
                    heading: "Prioity Level",
                    items: ['low', 'medium', 'high'],
                    hintText: "medium",
                  ),
                  const SizedBox(height: 8),
            
                  Dropdownfield(
                    heading: "Set Source Account",
                    items: ['low', 'medium', 'high'],
                    hintText: "Select an Source Account",
                  ),
                  const SizedBox(height: 15),
            
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(380, 48),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                         side: const BorderSide(
                              width: 0.5,
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        
                        ),
                        backgroundColor: Color.fromRGBO(3, 150, 157,1),
                        ),
                    child: Text("Set Goal",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
