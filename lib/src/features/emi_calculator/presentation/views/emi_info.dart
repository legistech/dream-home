import 'package:dream_home/src/features/emi_calculator/presentation/widgets/slider_maxmin.dart';
import 'package:flutter/material.dart';

class EmiInfo extends StatelessWidget {
  const EmiInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 5,
        ),
        SizedBox(width: 0), // Add some spacing between the circle and text
        CommonText(
          text: "Total Interest",
          padding: EdgeInsets.only(left: 5),
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 5,
        ),
        SizedBox(width: 5),
        CommonText(
          text: "Loan Amount",
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 5,
        ),
        SizedBox(width: 5),
        CommonText(
          text: "Processing Fees",
          padding: EdgeInsets.only(right: 20),
        )
      ],
    );
  }
}
