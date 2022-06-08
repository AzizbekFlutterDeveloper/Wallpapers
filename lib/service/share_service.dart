import 'package:flutter_share/flutter_share.dart';

class Serviceshare {
  static Future<void> share() async {
    await FlutterShare.share(
      title: "Wallpapers",
      linkUrl: 'https://t.me/Azizbek0033',
      chooserTitle: "Wallpapers",
    );
  }
}
