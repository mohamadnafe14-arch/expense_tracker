import 'package:flutter/material.dart';

class TranactionCard extends StatelessWidget {
  const TranactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.yellow.shade700,
                child: Icon(
                  Icons.food_bank,
                  size: 30,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(width: 10),
              Text('Expense', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              Text(
                '-\$200',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                'Category',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
