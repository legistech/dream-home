import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';

class EstimateValueCalculator {
  String calculateEstimate(Property property) {
    double estimate = 0;
    if (property.propertySize! > 0 && property.propertyCost! > 0) {
      estimate += property.propertySize! * 150;
    }
    if (property.propertyType == 'Apartment') {
      estimate += 10000;
    } else if (property.propertyType == 'House') {
      estimate += 20000;
    } else if (property.propertyType == 'Land') {
      estimate += 5000;
    }
    if (property.bathRoom != null && property.bathRoom!.contains('1')) {
      estimate += 1000;
    } else if (property.bathRoom != null && property.bathRoom!.contains('2')) {
      estimate += 3000;
    } else if (property.bathRoom != null && property.bathRoom!.contains('3')) {
      estimate += 7000;
    } else if (property.bathRoom != null && property.bathRoom!.contains('4')) {
      estimate += 10000;
    } else if (property.bathRoom != null && property.bathRoom!.contains('5')) {
      estimate += 15000;
    }

    if (property.bedRoom != null && property.bedRoom!.contains('1')) {
      estimate += 1000;
    } else if (property.bedRoom != null && property.bedRoom!.contains('2')) {
      estimate += 4000;
    } else if (property.bedRoom != null && property.bedRoom!.contains('3')) {
      estimate += 8000;
    } else if (property.bedRoom != null && property.bedRoom!.contains('4')) {
      estimate += 10000;
    } else if (property.bedRoom != null && property.bedRoom!.contains('5')) {
      estimate += 20000;
    }

    if (property.balcony == '1') {
      estimate += 1000;
    } else if (property.balcony == '2') {
      estimate += 2000;
    } else if (property.balcony == '3') {
      estimate += 3000;
    } else if (property.balcony == '4') {
      estimate += 4000;
    } else if (property.balcony == '5') {
      estimate += 5000;
    }

    if (property.furnitureStatus == 'Furnished') {
      estimate += 10000;
    } else if (property.furnitureStatus == 'Semi-Furnished') {
      estimate += 8000;
    } else if (property.furnitureStatus == 'Unfurnished') {
      estimate += 4000;
    }

    if (property.isCoveredParking!) {
      estimate += 1000;
    }

    if (property.isPetFriendly!) {
      estimate += 1000;
    }

    if (property.isResidential!) {
      estimate += 1000;
    }

    if (property.isUnderConstruction!) {
      estimate += 1000;
    }

    if (property.amenities!.contains('lift')) {
      estimate += 900000;
    }

    if (property.amenities!.contains('cctv')) {
      estimate += 1000;
    }

    if (property.amenities!.contains('Garden')) {
      estimate += 10000;
    }

    if (property.amenities!.contains('Parking')) {
      estimate += 10000;
    }

    if (property.amenities!.contains('swimmingPool')) {
      estimate += 5000000;
    }

    if (property.amenities!.contains('gym')) {
      estimate += 300000;
    }

    if (property.amenities!.contains('gasPipeline')) {
      estimate += 1000;
    }

    if (estimate > 100000 && estimate < 1000000) {
      return '\$${(estimate / 1000).toStringAsFixed(2)}K';
    } else if (estimate > 1000000 && estimate < 10000000) {
      return '\$${(estimate / 1000000).toStringAsFixed(2)}M';
    } else if (estimate > 10000000) {
      return '\$${(estimate / 10000000).toStringAsFixed(2)}B';
    } else {
      return '\$${estimate.toStringAsFixed(2)}';
    }
  }
}
