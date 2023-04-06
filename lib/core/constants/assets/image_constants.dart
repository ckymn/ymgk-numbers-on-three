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
  String get onboard1 => toPng('onboard_image1');
  String get onboard2 => toPng('onboard_image2');
  String get onboard3 => toPng('onboard_image3');

  String get phoneVerify => toPng('phone_verify');

  String toPng(value) => 'assets/images/$value.png';
}
