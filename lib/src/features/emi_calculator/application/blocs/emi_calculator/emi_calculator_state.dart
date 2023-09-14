part of 'emi_calculator_bloc.dart';

@immutable
sealed class EmicalculatorState {}

final class EmicalculatorInitial extends EmicalculatorState {}

final class Emicalculated extends EmicalculatorState {
  final double emi;

  Emicalculated({
    required this.emi,
  });
}