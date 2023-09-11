import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/filters.dart';
import '../../../domain/models/property.dart';

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
