import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String reason;

  const ContactButton({super.key, required this.reason});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFF25D366),
      ),
      onPressed: () {
        shareOnWhatsApp(message: "التطبيق لا يشتغل وتظهر المشكلة التالية: \n$reason", phoneNumber: AppConsts.contactPhone);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            "تواصل معنا عبر واتساب",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Icon(CupertinoIcons.chat_bubble_fill, color: Colors.white),
        ],
      ),
    );
  }
}
