import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';
import 'package:bhf_player/core/utils/extensions/error_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers_exports.dart';

Future<void> shareOnWhatsApp({String? phoneNumber, String message = "السلام عليكم ورحمة الله وبركاته"}) async {
  final encodedMessage = Uri.encodeComponent(message);
  final urlText = phoneNumber == null
      ? 'https://wa.me/?text=$encodedMessage'
      : 'https://wa.me/$phoneNumber?text=$encodedMessage';

  final whatsappUri = Uri.parse(urlText);

  try {
    final canLaunch = await canLaunchUrl(whatsappUri);
    if (!canLaunch) {
      throw WhatsAppLaunchException('لا يمكن فتح واتساب');
    }

    final didLaunch = await launchUrl(whatsappUri);
    if (!didLaunch) {
      throw WhatsAppLaunchException('حدث خطأ أثناء محاولة تشغيل واتساب');
    }
  } catch (e) {
    e.logError();
    Notifications.showFlushbar(
      message: e is WhatsAppLaunchException ? e.message : 'لا يمكن فتح واتساب',
      iconType: IconType.error,
    );
  }
}
