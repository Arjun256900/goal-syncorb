import 'package:flutter/material.dart';
import 'package:goal/widgets/add_container.dart';
import 'package:goal/widgets/transaction_card.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        title: Text(
          "Transaction Management",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddContainer(
              subtext: "Add New Transaction",
              isGoal: false,
             
            ),
            const SizedBox(height: 25),
            Text(
              "Recent Transaction",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            TransactionCard(
              amount: "300",
              date: "16 sep",
              heading: "Swiggy",
              time: "6:45 PM",
              sendOrReceived: "Received",
              debitOrCredit: "Credit",
            ),
          ],
        ),
      ),
    );
  }
}
