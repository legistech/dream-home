import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_property_event.dart';
part 'create_property_state.dart';

class CreatePropertyBloc
    extends Bloc<CreatePropertyEvent, CreatePropertyState> {
  CreatePropertyBloc() : super(CreatePropertyInitial()) {
    on<CreatePropertyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
