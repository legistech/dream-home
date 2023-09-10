import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/location.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/major_info.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/neighborhood_info.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/title.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/amenities.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/featured_image.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/info_icon.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/view_title.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SinglePropertyScreen extends StatelessWidget {
  const SinglePropertyScreen({super.key, required this.property});

  final Property property;
  final String baseUrl = 'https://dream-home.pockethost.io/api/files/';

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const ViewTitle('Property Details'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: property.id!,
                  child: FeaturedImage(
                    '$baseUrl/${property.collectionId}/${property.id}/${property.images!.first}',
                    borderColor: Pellet.kWhite,
                  ),
                ),
                SizedBox(height: height * 2),
                TitleView(property: property),
                SizedBox(height: height * 1),
                LocationView(property: property),
                SizedBox(height: height * 1),
                MajorInfoView(property: property),
                SizedBox(height: height * 1),
                const ViewTitle('Description'),
                SizedBox(height: height * 1),
                Text(
                  property.propertyDetail!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const ViewTitle('Amenities'),
                SizedBox(height: height * 1),
                Amenities(property: property),
                SizedBox(height: height * 1),
                const ViewTitle('Explore Neighborhood'),
                SizedBox(height: height * 1),
                // TODO: Add neighbourhood information after devaish is done with the api
                const NeighborhoodDistanceView(),
                SizedBox(height: height * 1),
                InfoIcon(
                  title: 'Train Station',
                  asset: Asset.trainIcon,
                  subtitle: '${1.2} km',
                ),
                SizedBox(height: height * 1),
                const ViewTitle('Check your affordability'),
                SizedBox(height: height * 1),
                InfoIcon(
                    title: 'EMI Calculator',
                    asset: Asset.calculatorIcon,
                    subtitle: 'EMI Starts at 80.50K'),
                // TODO: Add affordability information after abdullah is done with the emi calculator
                SizedBox(height: height * 1),
                const ViewTitle('Price Insights'),
                SizedBox(height: height * 1),
                InfoIcon(
                  title: 'Property Price increased by 2.5%',
                  asset: Asset.increaseIcon,
                  subtitle: 'Price increased by 2.5% in last 6 months',
                ),
                // TODO: Add price insights after abdullah is done with the price estimator
                SizedBox(height: height * 1),
                const ViewTitle('Contact Agent'),
                SizedBox(height: height * 1),
                InfoIcon(
                    title: property.expand!.createdBy!.name!,
                    asset: Asset.appleLogo,
                    subtitle: property.userStatus!),
                SizedBox(height: height * 5),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Pellet.kPrimaryColor,
          child: const Icon(IconlyLight.chat),
        ),
      ),
    );
  }
}
