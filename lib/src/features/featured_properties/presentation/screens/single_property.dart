import 'package:cached_network_image/cached_network_image.dart';
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

class SinglePropertyScreen extends StatefulWidget {
  const SinglePropertyScreen({super.key, required this.property});

  final Property property;

  @override
  State<SinglePropertyScreen> createState() => _SinglePropertyScreenState();
}

class _SinglePropertyScreenState extends State<SinglePropertyScreen> {
  final String baseUrl = 'https://dream-home.pockethost.io/api/files/';
  String featuredImage = '';

  @override
  void initState() {
    super.initState();
    featuredImage =
        '$baseUrl/${widget.property.collectionId}/${widget.property.id}/${widget.property.images!.first}';
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
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
                  tag: widget.property.id!,
                  child: FeaturedImage(
                    featuredImage,
                    borderColor: Pellet.kWhite,
                  ),
                ),
                SizedBox(height: height * 1),
                SizedBox(
                  height: height * 10,
                  width: width * 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        final currentImage =
                            '$baseUrl/${widget.property.collectionId}/${widget.property.id}/${widget.property.images![index]}';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              featuredImage = currentImage;
                            });
                          },
                          child: Container(
                            height: height * 10,
                            width: width * 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  currentImage,
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: widget.property.images!.length),
                ),
                SizedBox(height: height * 1),
                TitleView(property: widget.property),
                SizedBox(height: height * 1),
                LocationView(property: widget.property),
                SizedBox(height: height * 1),
                MajorInfoView(property: widget.property),
                SizedBox(height: height * 1),
                const ViewTitle('Description'),
                SizedBox(height: height * 1),
                Text(
                  widget.property.propertyDetail!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const ViewTitle('Amenities'),
                SizedBox(height: height * 1),
                Amenities(property: widget.property),
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
                    title: widget.property.expand!.createdBy!.name!,
                    asset: Asset.appleLogo,
                    subtitle: widget.property.userStatus!),
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
