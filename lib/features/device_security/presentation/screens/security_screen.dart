import 'package:bhf_player/core/utils/helpers_functions/platform_utils/platform_utils.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/warning_icon.dart';
import '../widgets/reason_card.dart';
import '../widgets/contact_button.dart';

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
    Future.delayed(Duration(seconds: seconds), closeApp);
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
            spacing: 25,
            children: [
              const WarningIcon(),
              ReasonCard(reason: widget.reason, seconds: seconds),
              ContactButton(reason: widget.reason),
            ],
          ),
        ),
      ),
    );
  }
}
