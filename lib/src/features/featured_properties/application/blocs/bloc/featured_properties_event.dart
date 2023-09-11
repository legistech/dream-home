part of 'featured_properties_bloc.dart';

sealed class FeaturedPropertiesEvent extends Equatable {
  const FeaturedPropertiesEvent();

  @override
  List<Object> get props => [];
}

final class FeaturedFilterChipSelected extends FeaturedPropertiesEvent {
  final int index;
  final List<Property> properties;

  const FeaturedFilterChipSelected(
      {required this.properties, required this.index});

  @override
  List<Object> get props => [index, properties];
}
