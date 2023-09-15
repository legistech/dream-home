part of 'create_property_bloc.dart';

sealed class CreatePropertyState extends Equatable {
  const CreatePropertyState();
  
  @override
  List<Object> get props => [];
}

final class CreatePropertyInitial extends CreatePropertyState {}
