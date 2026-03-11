import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/inputs/digit_input.dart';

class VerifyEmailForm extends HookConsumerWidget {
  const VerifyEmailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(alignment: Alignment.center, child: AppDigitInput()),
          SizedBox(height: context.dimensions.dim6.h),
          AppButton(text: 'ดำเนินการต่อ', loadingText: 'กำลังตรวจสอบ...', onPressed: () {}),
        ],
      ),
    );
  }
}
