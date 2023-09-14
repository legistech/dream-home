import 'package:dream_home/src/features/emi_calculator/presentation/widgets/total_income_info.dart';
import 'package:flutter/material.dart';

class CalculatedValues extends StatelessWidget {
  const CalculatedValues({
    super.key,
    required this.totalAmount,
    required this.loanAmount,
    required this.processingFees,
  });
  final double totalAmount, loanAmount, processingFees;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonStyledText(
          text: "\$ $totalAmount",
          padding: const EdgeInsets.only(left: 20),
        ),
        const Spacer(),
        CommonStyledText(
          text: "\$ $loanAmount",
        ),
        const Spacer(),
        CommonStyledText(
          text: "\$ $processingFees",
          padding: const EdgeInsets.only(right: 20),
        ),
      ],
    );
  }
}
