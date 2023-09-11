import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';
import '../../domain/models/property.dart';
import '../views/location.dart';
import '../views/major_info.dart';
import '../views/neighborhood_info.dart';
import '../views/title.dart';
import '../widgets/amenities.dart';
import '../widgets/featured_image.dart';
import '../widgets/info_icon.dart';
import '../widgets/view_title.dart';

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
