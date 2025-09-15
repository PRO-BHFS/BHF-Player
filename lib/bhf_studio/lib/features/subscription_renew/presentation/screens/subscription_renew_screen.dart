import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/notifications/notifications.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/validators.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/styles/app_sizes/app_sizes.dart';
import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/controller/admin_vip/admin_vip_controller.dart';
import 'package:bhf_player/bhf_studio/lib/features/admin_vip/presentation/controller/admin_vip/admin_vip_state.dart';
import 'package:bhf_player/bhf_studio/lib/features/device_id/presentation/widgets/admin_id_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionRenewScreen extends StatefulWidget {
  const SubscriptionRenewScreen({super.key});

  @override
  State<SubscriptionRenewScreen> createState() =>
      _SubscriptionRenewScreenState();
}

class _SubscriptionRenewScreenState extends State<SubscriptionRenewScreen> {
  final subscriptionCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    subscriptionCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminVipCubit, AdminVipState>(
      listener: (context, state) {
        if (state is AdminVipErrorState) {
          Notifications.showFlushbar(
            message: state.message,
            iconType: IconType.error,
          );
        }
        if (state is AdminVipCoinsAddedState) {
          Notifications.showFlushbar(
            message: state.message,
            iconType: IconType.done,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("تجديد باقة")),
        body: ListView(
          padding: const EdgeInsets.all(AppSizes.mainPadding),
          shrinkWrap: true,
          children: [
            const AdminIdDashboard(),
            Form(
              key: formKey,
              child: RoundedContainer(
                child: Column(
                  spacing: AppSizes.spacingMiddle,
                  children: [
                    BuildFormField(
                      controller: subscriptionCodeController,
                      labelText: "Code",
                      hintText: "ادخل رمز الاشتراك هنا",
                      suffixIcon: BuildIconButton(
                        icon: const BuildSvgIcon(IconsAssets.paste),
                        onPressed:
                            subscriptionCodeController.pasteFromClipboard,
                      ),
                      onFieldSubmitted: (_) => _onRenewSubscriptionPressed(),
                      validator: checkFieldEmpty,
                    ),

                    BuildButton(
                      text: "تجديد الاشتراك",
                      onPress: _onRenewSubscriptionPressed,
                    ),
                  ],
                ),
              ),
            ),
          ].separatedBy(const SizedBox(height: AppSizes.spacingMiddle)),
        ),
      ),
    );
  }

  void _onRenewSubscriptionPressed() {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;
    final fullCode = subscriptionCodeController.text;
    context.read<AdminVipCubit>().redeemSubscriptionCode(fullCode);
  }
}
