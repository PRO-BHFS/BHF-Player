import 'package:bhf_player/bhf_studio/lib/core/presentation/components/buttons/circle_icon_button.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/icons/build_svg_icon.dart';
import 'package:bhf_player/bhf_studio/lib/core/presentation/components/rounded_container.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/assests/icons.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartPasswordViewer extends StatelessWidget {
  const SmartPasswordViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenerateSmartPasswordCubit, GenerateSmartPasswordState>(
      listener: (context, state) async {
        if (state case GenerateSmartPasswordSuccessfully(
          :final smartPassword,
          :final message,
        )) {
          Notifications.showFlushbar(message: message, iconType: IconType.done);

          await smartPassword.copyToClipboard();
        }

        if (state case GenerateSmartPasswordError(:final message)) {
          Notifications.showFlushbar(
            message: message,
            iconType: IconType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is! GenerateSmartPasswordSuccessfully) {
          return const SizedBox.shrink();
        }

        final smartPassword = state.smartPassword;

        return RoundedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              Row(
                spacing: 10,
                children: [
                  const BuildIcon(Icons.key_sharp),
                  Text(
                    'كلمة المرور الذكية',
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),

              SelectableText(
                smartPassword,

                style: context.textTheme.labelSmall,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 10,
                children: [
                  CircleIconButton(
                    circleColor: context.colorScheme.primary,
                    onPressed: () {},
                    icon: const BuildIcon(Icons.share),
                  ),

                  CircleIconButton(
                    circleColor: context.colorScheme.primary,
                    onPressed: smartPassword.copyToClipboard,
                    icon: const BuildSvgIcon(IconsAssets.copy),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
