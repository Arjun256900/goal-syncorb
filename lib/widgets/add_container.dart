import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal/screens/add_new_goal.dart';
import 'package:goal/screens/add_new_transaction_screen.dart';

class AddContainer extends StatelessWidget {
  final String subtext;
  final bool isGoal;
  const AddContainer({super.key, required this.subtext, required this.isGoal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) =>
                isGoal ? AddNewGoal() : AddNewTransactionScreen(),
          ),
        ),
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
              Text(subtext),
            ],
          ),
        ),
      ),
    );
  }
}
