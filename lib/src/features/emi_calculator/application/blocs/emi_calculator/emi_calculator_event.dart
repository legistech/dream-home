part of 'emi_calculator_bloc.dart';

sealed class EmicalculatorEvent extends Equatable {
  const EmicalculatorEvent();
  @override
  List<Object> get props => [];
}

class EmicalculatorValueChanged extends EmicalculatorEvent {
  final double loanAmount;
  final double interestRate;
  final double loanTenure;

  const EmicalculatorValueChanged({
    required this.loanAmount,
    required this.interestRate,
    required this.loanTenure,
  });
}
