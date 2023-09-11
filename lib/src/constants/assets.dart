import 'dart:math';

/// [Asset] is used to store and retrieve all
/// the assets strings used in the app.
/// use [instance] getter to get the instance of [Asset]
class Asset {
  static String get logo => 'assets/images/dream-home.png';
  static String get welcome => 'assets/images/welcome.jpg';
  static String get appleLogo => 'assets/images/apple.png';
  static String get googleLogo => 'assets/images/google.png';
  static String get facebookLogo => 'assets/images/facebook.png';
  static String get schoolIcon => 'assets/icons/school.png';
  static String get trainIcon => 'assets/icons/train-station.png';
  static String get hospitalIcon => 'assets/icons/hospital.png';
  static String get hotelIcon => 'assets/icons/hotel.png';
  static String get calculatorIcon => 'assets/icons/calculator.png';
  static String get increaseIcon => 'assets/icons/increase.png';
  static String get decreaseIcon => 'assets/icons/decrease.png';
  static String get featuredImage {
    final images = [
      'https://www.aurecongroup.com/-/media/images/aurecon/content/insights/botf_featured-insights_buildings-of-the-future/building-of-the-future-desktop-v2.jpg?as=0&w=2048',
      'https://www.shapesbyhydro.com/globalassets/shapes/expert-thoughts/materials-for-supertall-buildings01.jpg'
          'https://architizer-prod.imgix.net/media/1392288811491Executive_Arch_Interlace_Photo_1.jpg'
          'https://images.timesproperty.com/blog/2347/unnamed___2022_06_14T183130168.jpg'
    ];

    int randomIndex = Random().nextInt(images.length);

    return images[randomIndex];
  }
}
