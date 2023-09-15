import 'dart:math';

///class for emi calculator
class CalculateEmi {
  //method to calculate emi
  static double calculateEMI(
      double loanAmount, double annualInterestRate, double loanTenureInYears) {
    double emi;

    double monthlyInterestRate =
        annualInterestRate / (12 * 100); // one month interest
    double loanTenureInMonths = loanTenureInYears * 12; // one month period

    emi = (loanAmount *
            monthlyInterestRate *
            pow(1 + monthlyInterestRate, loanTenureInMonths)) /
        (pow(1 + monthlyInterestRate, loanTenureInMonths) - 1);

    return emi;
  }
}
