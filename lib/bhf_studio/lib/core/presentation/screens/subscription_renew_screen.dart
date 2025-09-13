import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/validators.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/presentation/widgets/admin_id_dashboard.dart';

import 'package:flutter/material.dart';

class SubscriptionRenewScreen extends StatefulWidget {
  const SubscriptionRenewScreen({super.key});

  @override
  State<SubscriptionRenewScreen> createState() =>
      _SubscriptionRenewScreenState();
}

class _SubscriptionRenewScreenState extends State<SubscriptionRenewScreen> {
  final subscriptionCodeController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    subscriptionCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تجديد باقة")),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.mainPadding),
        shrinkWrap: true,
        children: [
          const AdminIdDashboard(),
          Form(
            child: RoundedContainer(
              child: Column(
                children: [
                   BuildFormField(
                    controller: subscriptionCodeController,
                    labelText: "Code",
                    hintText: "ادخل رمز الاشتراك هنا",
                    onFieldSubmitted: (_) {},
                    validator: checkFieldEmpty,
                  ),
              
                  BuildButton(text: "تجديد الاشتراك", onPress: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
