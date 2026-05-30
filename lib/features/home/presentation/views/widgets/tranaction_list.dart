import 'package:expense_tracker/features/home/presentation/views/widgets/tranaction_card.dart';
import 'package:flutter/material.dart';

class TranacionList extends StatelessWidget {
  const TranacionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
        itemBuilder: (context, index) => const TranactionCard(),
      ),
    );
  }
}
