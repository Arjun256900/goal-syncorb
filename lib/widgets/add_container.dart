import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal/screens/add_new_goal.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(
          context,
        ).push(CupertinoPageRoute(builder: (context) => AddNewGoal())),
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 105,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFE8F5F6),
                child: Center(child: Icon(Icons.add)),
              ),
              const SizedBox(height: 8),
              Text("Add New Goal"),
            ],
          ),
        ),
      ),
    );
  }
}
