import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers_exports.dart';

Future<void> shareOnWhatsApp({String? phoneNumber, String message = ""}) async {
  final encodedMessage = Uri.encodeComponent(message);
  final urlText = phoneNumber == null
      ? 'whatsapp://send?text=$encodedMessage'
      : 'whatsapp://send?phone=$phoneNumber&text=$encodedMessage';

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
    Notifications.showFlushbar(
      message: e is WhatsAppLaunchException ? e.message : 'لا يمكن فتح واتساب',
      iconType: IconType.error,
    );
  }
}
