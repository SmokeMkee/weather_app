abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String cloudy = 'assets/images/bitmap/img.png';

  final String test1 = 'assets/images/bitmap/img_1.png';
}

class _Svg {
  const _Svg();

  final String location = 'assets/images/svg/location.svg';
  final String cloudy = 'assets/images/svg/cloudy.svg';
  final String focus = 'assets/images/svg/focus.svg';
  final String backArrow = 'assets/images/svg/back_arrow.svg';
  final String windy = 'assets/images/svg/windy.svg';
  final String hun = 'assets/images/svg/hum.svg';
}
