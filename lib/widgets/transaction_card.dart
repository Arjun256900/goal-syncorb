import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String amount;
  final String heading;
  final String date;
  final String time;
  final String sendOrReceived;
  final String debitOrCredit;
  const TransactionCard({
    super.key,
    required this.amount,
    required this.date,
    required this.heading,
    required this.time,
    required this.sendOrReceived,
    required this.debitOrCredit,
  });
  Color getDebitOrCredit(BuildContext context,String debitOrCredit) {
    switch (debitOrCredit.toLowerCase()) {
      case 'debit':
        return Color(0xFFFF0000);
      case 'credit':
        return Theme.of(context).primaryColor;
      default:
        return Color(0xFFF97358);
    }
  }

  Icon getDebitOrCreditIcon(BuildContext context, debitOrCredit) {
    final color = getDebitOrCredit(context, debitOrCredit);
    if (debitOrCredit.toLowerCase() == "debit") {
      return Icon(
        Icons.remove,
        color: color,
        size: 18,
      );
    } else if (debitOrCredit.toLowerCase() == "credit") {
      return Icon(Icons.add, color: color, size: 18);
    } else {
      return Icon(Icons.help_outline, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.leave_bags_at_home,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      sendOrReceived,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 0.45),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getDebitOrCreditIcon(context,debitOrCredit),
                    SizedBox(width: 2),
                    Text(
                      '₹ $amount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: getDebitOrCredit(context,debitOrCredit),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '$date,$time',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.45),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
