import 'package:bhf_player/bhf_studio/lib/core/presentation/components/widgets_exports.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_cubit.dart';
import 'package:bhf_player/bhf_studio/lib/features/generate_smart_password/presentation/controller/generate_smart_password/generate_smart_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPasswordText extends StatelessWidget {
  const BuildPasswordText({super.key});

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

        return ListBody(
          children: [
            const Text('كلمة المرور الذكية:'),

            SelectableText(state.smartPassword),

            BuildPrimaryButton(
              text: 'نسخ كلمة المرور',
              onPress: state.smartPassword.copyToClipboard,
            ),
          ].separatedBy(const SizedBox(height: 20)),
        );
      },
    );
  }
}
