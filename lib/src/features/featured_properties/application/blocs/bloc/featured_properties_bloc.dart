import 'package:dream_home/src/features/featured_properties/data/repositories/filters.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_properties_event.dart';
part 'featured_properties_state.dart';

class FeaturedPropertiesBloc
    extends Bloc<FeaturedPropertiesEvent, FeaturedPropertiesState> {
  FeaturedPropertiesBloc() : super(FeaturedPropertiesInitial()) {
    on<FeaturedFilterChipSelected>((event, emit) {
      final prevState = state;
      emit(FeaturedFilteredProperties(
          properties: Filter.filterProperties(event.properties, event.index)));
      emit(prevState);
    });
  }
}
