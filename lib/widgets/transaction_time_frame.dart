import 'package:flutter/material.dart';

class TransactionTimeFrame extends StatefulWidget {
  const TransactionTimeFrame({super.key});

  @override
  State<TransactionTimeFrame> createState() => _TransactionTimeFrameState();
}

class _TransactionTimeFrameState extends State<TransactionTimeFrame> {
  @override
  Widget build(BuildContext context) {
    final List<String> filters = [
      'All',
      '7 days',
      '30 days',
      '90 days',
      '180 days',
    ];
    String selected = 'All';
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final bool isSelected = selected == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = filter;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected ? Border.all(color: Colors.black) : null,
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
