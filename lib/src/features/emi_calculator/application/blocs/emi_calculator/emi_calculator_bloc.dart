import 'package:bloc/bloc.dart';
import 'package:dream_home/src/features/emi_calculator/data/repository/calculate_emi.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'emi_calculator_event.dart';
part 'emi_calculator_state.dart';

class EmicalculatorBloc extends Bloc<EmicalculatorEvent, EmicalculatorState> {
  EmicalculatorBloc() : super(EmicalculatorInitial()) {
    on<EmicalculatorValueChanged>((event, emit) {
      final emi = CalculateEmi.calculateEMI(
          event.loanAmount, event.interestRate, event.loanTenure);
      emit(Emicalculated(emi: emi));

    });
  }
}
