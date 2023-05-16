class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();
  String get logo => toPng('logo');
  String get facebook => toPng('facebook');
  String get google => toPng('google');

  // Onboarding
  String get onboard1 => toPng('mathematics');
  String get onboard2 => toPng('success');
  String get onboard3 => toPng('think');

  String get tree => toPng('tree');

  String toPng(value) => 'assets/images/$value.png';
}
