import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_property_event.dart';
part 'create_property_state.dart';

class CreatePropertyBloc
    extends Bloc<CreatePropertyEvent, CreatePropertyState> {
  CreatePropertyBloc() : super(CreatePropertyInitial()) {
    String contactNumber = '';
    String propertyName = "";
    bool isSelling = false;
    on<CreatePropertyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
