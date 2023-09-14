import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CommonSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const CommonSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  String formatLoanAmount(double amount) {
    if (amount >= 10000000) {
      // If more than or equal to 1 crore, display in crore format
      double croreValue = amount / 10000000;
      //int remainingLacs = (amount % 10000000) ~/ 100000;
      return '\$ ${croreValue.toStringAsFixed(2)} Billion';
    } else if (amount >= 100000) {
      // If more than or equal to 1 lac, display in lac format
      int lacsValue = amount ~/ 100000;
      return '\$ $lacsValue H.thousand';
    } else {
      // If less than 1 lac, display in original format
      return '\$ ${amount.toInt()}';
    }
  }

  String formatROI(double roi) {
    return '${roi.toStringAsFixed(1)}%';
  }

  String formatYrs(double yrs) {
    return '${yrs.toStringAsFixed(0)} Years';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                //call formatLoanAmount when label is Loan Amount
                label == "Loan Amount"
                    ? formatLoanAmount(value)
                    : label == "Rate of Interest (%)"
                        ? formatROI(value)
                        : formatYrs(value),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
          activeColor: Pellet.kPrimaryColor,
          inactiveColor: Pellet.kWhite,
        ),
      ],
    );
  }
}
