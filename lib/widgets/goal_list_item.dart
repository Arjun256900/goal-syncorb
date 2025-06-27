import 'package:flutter/material.dart';

class GoalListItem extends StatelessWidget {
  final String heading;
  final String amount;
  final String deadline;
  final String sourceAccount;
  final String priority;
  final String percentage;
  const GoalListItem({
    super.key,
    required this.amount,
    required this.deadline,
    required this.heading,
    required this.priority,
    required this.sourceAccount,
    required this.percentage,
  });
  Color getPriorityColor(BuildContext context ,priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Color(0xFFF97358);
      case 'medium':
        return Colors.orange;
      case 'low':
        return Theme.of(context).primaryColor;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: getPriorityColor(context,priority),
                      ),
                      child: Icon(
                        Icons.home_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      heading,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  '$percentage% complete',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 7),
                    Text('Target Amount', style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8.5),
                    Text('Deadline', style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8.5),
                    Text("Source Amount", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8.5),
                    Text("Priority Level", style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 7),
                    Text(
                      '₹$amount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(deadline, style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8.5),
                    Text(sourceAccount, style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8.5),
                    Text(
                      priority,
                      style: TextStyle(
                        color: getPriorityColor(context ,priority),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
