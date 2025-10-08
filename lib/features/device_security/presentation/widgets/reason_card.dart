import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';

class ReasonCard extends StatelessWidget {
  final String reason;
  final int seconds;

  const ReasonCard({super.key, required this.reason, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.mainPadding),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF430F0F)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          const Text(
            "لا يمكن تشغيل التطبيق",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            reason,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFCDD0D6),
              fontSize: 14,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: const Size(double.infinity, 45),
              backgroundColor: const Color.fromARGB(214, 75, 15, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: null,
            child: Text(
              "سيتم اغلاق التطبيق خلال $seconds ثواني",
              style: const TextStyle(color: Color(0xFFD90D0D)),
            ),
          ),
        ],
      ),
    );
  }
}
