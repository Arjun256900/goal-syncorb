import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal/screens/set_goal.dart';
import 'package:goal/screens/transaction_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(CupertinoPageRoute(builder: (context) => SetGoal()));
            },
            child: Text("Goal"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => TransactionScreen()),
              );
            },
            child: Text("Transaction"),
          ),
        ],
      ),
    );
  }
}
