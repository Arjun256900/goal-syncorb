import 'package:flutter/material.dart';
import 'package:goal/widgets/Goal_list_item.dart';
import 'package:goal/widgets/add_container.dart';

class SetGoal extends StatelessWidget {
  const SetGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goal", style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Color(0xFFF0F0F0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            AddContainer(),
            const SizedBox(height: 25),
            Text(
              "Ongoing Goal List",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            GoalListItem(
              amount: "30,000",
              deadline: "sep 2023",
              heading: "Apartment",
              priority: "High",
              sourceAccount: "Dummy",
              percentage: "50",
            ),
            const SizedBox(height: 12),
            GoalListItem(
              amount: "30,000",
              deadline: "sep 2023",
              heading: "Apartment",
              priority: "low",
              sourceAccount: "Dummy",
              percentage: "50",
            ),
          ],
        ),
      ),
    );
  }
}
