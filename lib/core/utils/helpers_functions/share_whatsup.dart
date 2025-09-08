import 'package:url_launcher/url_launcher.dart';

import 'helpers_exports.dart';

Future<void> shareOnWhatsApp( String text) async {
  final String whatsappUrl = 'whatsapp://send?text=$text';
  final Uri uri = Uri.parse(whatsappUrl);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
  Notifications.showFlushbar(message: 'لا يمكن فتح واتساب', iconType: IconType.error);
  }
}
