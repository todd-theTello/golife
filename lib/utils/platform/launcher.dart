import 'package:url_launcher/url_launcher.dart';

///
class LauncherUtil {
  ///
  static Future<void> launch({required LaunchType launchType, required String url}) async {
    final uriString = switch (launchType) {
      LaunchType.url => 'https:$url',
      LaunchType.sms => 'sms:$url',
      LaunchType.tel => 'tel:$url',
      LaunchType.mail => 'mailto:$url',
    };
    final Uri uri = Uri.parse(uriString);
    if (launchType == LaunchType.url) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      await launchUrl(uri);
    }
  }
}

///
enum LaunchType {
  ///
  url,

  ///
  sms,

  ///
  tel,

  ///
  mail
}
