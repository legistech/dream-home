import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';

/// [Filter]'s class is used to filter properties based on different matching criteria
class Filter {
  static List<Property> filterProperties(List<Property> properties, int index) {
    // returns a list of properties where selling status is set to true
    if (index == 0) {
      return properties
          .where((property) => property.isSelling == true)
          .toList();
    }
    // returns a list of properties where selling status is set to false
    // which means property is for rent

    else if (index == 1) {
      return properties
          .where((property) => property.isSelling == false)
          .toList();
    } else if (index == 2) {
      // returns a list of properties where is residential is set to false

      return properties
          .where((property) => property.isResidential == false)
          .toList();
    } else {
      // returns a list of properties where furnitureStatus is set to fully furnished

      return properties
          .where((property) => property.furnitureStatus == 'fullyFurnished')
          .toList();
    }
  }
}
