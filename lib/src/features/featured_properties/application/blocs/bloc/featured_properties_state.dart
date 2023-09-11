part of 'featured_properties_bloc.dart';

sealed class FeaturedPropertiesState extends Equatable {
  const FeaturedPropertiesState();

  @override
  List<Object> get props => [];
}

final class FeaturedPropertiesInitial extends FeaturedPropertiesState {}

final class FeaturedFilteredProperties extends FeaturedPropertiesState {
  final List<Property> properties;

  const FeaturedFilteredProperties({required this.properties});

  @override
  List<Object> get props => [properties];
}
