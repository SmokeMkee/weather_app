abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String sunCloudy = 'assets/images/bitmap/sun_cloudy.png';
  final String bgDelimiter = 'assets/images/bitmap/bg_delimiter.png';
  final String cloudy = 'assets/images/bitmap/cloudy.png';
  final String night = 'assets/images/bitmap/night.png';
  final String rain = 'assets/images/bitmap/rain.png';
  final String snowy = 'assets/images/bitmap/snowy.png';
  final String sun = 'assets/images/bitmap/sun.png';
  final String thunder = 'assets/images/bitmap/thunder.png';
}

class _Svg {
  const _Svg();

  final String location = 'assets/images/svg/location.svg';
  final String focus = 'assets/images/svg/focus.svg';
  final String backArrow = 'assets/images/svg/back_arrow.svg';
  final String windy = 'assets/images/svg/windy.svg';
  final String hun = 'assets/images/svg/hum.svg';
}
