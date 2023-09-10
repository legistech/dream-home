import 'package:cached_network_image/cached_network_image.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/data/repositories/helpers.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.baseUrl,
    required this.property,
  });

  final String baseUrl;
  final Property property;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/property-details',
          arguments: {'property': property},
        );
      },
      child: Material(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Hero(
                tag: property.id!,
                child: Container(
                  height: height * 13,
                  width: width * 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$baseUrl/${property.collectionId}/${property.id}/${property.images!.first}',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: width * 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.propertyName!,
                      style: TextStyle(
                        color: Pellet.kDark,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('by ${property.expand!.createdBy!.name!}'),
                    const SizedBox(height: 5),
                    Text(property.address!),
                    Text(
                      HelperRepo.formatNumberRange(property.propertyCost!),
                      style: TextStyle(
                        color: Pellet.kDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
