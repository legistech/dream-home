import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/emi_calculator/application/blocs/emi_calculator/emi_calculator_bloc.dart';
import 'package:dream_home/src/features/emi_calculator/presentation/views/emi_info.dart';
import 'package:dream_home/src/features/emi_calculator/presentation/widgets/calculated_values.dart';
import 'package:dream_home/src/features/emi_calculator/presentation/widgets/slider.dart';
import 'package:dream_home/src/features/emi_calculator/presentation/widgets/slider_info.dart';
import 'package:dream_home/src/features/user_profile/presentation/widgets/profile_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({super.key});

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  double loanAmount = 100000.0;
  //rate of interest
  double roi = 6.0;
  //tenure in years
  double tenure = 1.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmicalculatorBloc, EmicalculatorState>(
      builder: (context, state) {
        final width = ScreenSize.height(context);
        return Container(
          decoration: BoxDecoration(
            gradient: Pellet.kBackgroundGradient,
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EMI Calculator',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "How it works?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 74, 74, 74)),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Your EMI Per Month",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 74, 74, 74)),
                  ),
                ),
                Center(
                  child: Text(
                    state is Emicalculated
                        ? "\$ ${state.emi.toStringAsFixed(0)}"
                        : "\$ 0",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const EmiInfo(),
                const SizedBox(height: 4),
                CalculatedValues(
                  totalAmount: state is Emicalculated
                      ? state.emi.floorToDouble() * tenure.floor() * 7.5
                      : 0.0,
                  loanAmount: loanAmount.floorToDouble(),
                  processingFees: loanAmount.floorToDouble() * 0.005,
                ),
                const SizedBox(height: 20),
                CommonSlider(
                  label: "Loan Amount",
                  value: loanAmount,
                  min: 100000.0,
                  max: 20000000.0,
                  divisions: 199,
                  onChanged: (newValue) {
                    // setState(() {
                    loanAmount = newValue;
                    context.read<EmicalculatorBloc>().add(
                          EmicalculatorValueChanged(
                            loanAmount: loanAmount,
                            interestRate: roi,
                            loanTenure: tenure,
                          ),
                        );
                    // });
                  },
                ),
                //apply text on left for text
                const CommonRow(
                  leftText: "1 H.thousand",
                  rightText: "2 Million",
                ),

                const SizedBox(height: 20),

                CommonSlider(
                  label: "Rate of Interest (%)",
                  value: roi,
                  min: 6.0,
                  max: 15.0,
                  divisions: 199,
                  onChanged: (newValue) {
                    // setState(() {
                    roi = newValue;
                    context.read<EmicalculatorBloc>().add(
                          EmicalculatorValueChanged(
                            loanAmount: loanAmount,
                            interestRate: roi,
                            loanTenure: tenure,
                          ),
                        );
                    // });
                  },
                ),
                const CommonRow(
                  leftText: "6%",
                  rightText: "15%",
                ),
                const SizedBox(height: 20),

                CommonSlider(
                  label: "Preferred Loan Tenure",
                  value: tenure,
                  min: 1,
                  max: 30,
                  divisions: 199,
                  onChanged: (newValue) {
                    tenure = newValue;
                    context.read<EmicalculatorBloc>().add(
                          EmicalculatorValueChanged(
                            loanAmount: loanAmount,
                            interestRate: roi,
                            loanTenure: tenure,
                          ),
                        );
                  },
                ),
                const CommonRow(
                  leftText: "1 year",
                  rightText: "30 years",
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: width * 40,
                  child: ProfileButton(
                    icon: Icons.send,
                    text: 'Apply for Loan',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
