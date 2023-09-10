import 'package:cached_network_image/cached_network_image.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:flutter/material.dart';

class FeaturedImage extends StatelessWidget {
  const FeaturedImage(this.imgUrl, {super.key, required this.borderColor});

  final String imgUrl;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Container(
      height: height * 25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imgUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
    );
  }
}
