import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';
import '../../data/repositories/helpers.dart';
import '../../domain/models/property.dart';

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
                  height: height * 12,
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
                      property.propertyName!.length > 20
                          ? '${property.propertyName!.substring(0, 20)}...'
                          : property.propertyName!,
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
