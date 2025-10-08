import 'package:bhf_player/core/utils/app_constants/app_constants.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  final String reason;

  const SecurityScreen({super.key, required this.reason});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final seconds = 10;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: seconds), () {
      closeApp().then((_) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221010),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.warning_amber_outlined,
                color: Color(0xFFF20D0D),
                size: 80,
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.mainPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF430F0F)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "لا يمكن تشغيل التطبيق",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.reason,
                      style: const TextStyle(
                        color: Color(0xFFCDD0D6),
                        fontSize: 16,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),

                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFF4B0F0F),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "سيتم اغلاق التطبيق خلال $seconds ثواني",
                          style: const TextStyle(color: Color(0xFFD90D0D)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF25D366)),
                  ),
                  onPressed: () {
                    shareOnWhatsApp(
                      message: widget.reason,
                      phoneNumber: AppConsts.contactPhone,
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        "تواصل معنا عبر واتساب",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Icon(
                        CupertinoIcons.chat_bubble_fill,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ].separatedBy(const SizedBox(height: 20)),
          ),
        ),
      ),
    );
  }
}
