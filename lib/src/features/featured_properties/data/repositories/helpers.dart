class HelperRepo {
  static String formatNumberRange(int number) {
    const int thousand = 1000;
    const int million = 1000000;
    const int billion = 1000000000;

    if (number < thousand) {
      return '$number - ${(number + thousand - 1)}';
    } else if (number < million) {
      double lowValue = (number / thousand);
      double highValue = (number + thousand - 1) / thousand;
      return '${lowValue.toStringAsFixed(1)}K - ${highValue.toStringAsFixed(1)}K';
    } else if (number < billion) {
      double lowValue = (number / million);
      double highValue = (number + million - 1) / million;
      return '${lowValue.toStringAsFixed(1)}M - ${highValue.toStringAsFixed(1)}M';
    } else {
      double lowValue = (number / billion);
      double highValue = (number + billion - 1) / billion;
      return '${lowValue.toStringAsFixed(1)}B - ${highValue.toStringAsFixed(1)}B';
    }
  }

  static String formatNumberWithSuffix(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      double num = number / 1000;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}K';
    } else if (number < 1000000000) {
      double num = number / 1000000;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}M';
    } else {
      double num = number / 1000000000;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}B';
    }
  }
}
