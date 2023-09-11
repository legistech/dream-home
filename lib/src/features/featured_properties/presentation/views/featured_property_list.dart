import 'package:cached_network_image/cached_network_image.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/data/repositories/helpers.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class FeaturedPropertyList extends StatelessWidget {
  const FeaturedPropertyList({
    super.key,
    required this.properties,
    required this.baseUrl,
  });

  final List<Property> properties;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return ListView.separated(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/property-details', arguments: {
              'property': properties[index],
            });
          },
          child: Column(
            children: [
              Hero(
                tag: properties[index].id!,
                child: Container(
                  height: height * 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          '$baseUrl/${properties[index].collectionId}/${properties[index].id}/${properties[index].images!.first}'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Pellet.kWhite,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              properties[index].expand!.createdBy!.name!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              properties[index].address!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '\$ ${HelperRepo.formatNumberWithSuffix(properties[index].propertyCost!)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${properties[index].propertySize!} sqft',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: height * 1);
      },
    );
  }
}
