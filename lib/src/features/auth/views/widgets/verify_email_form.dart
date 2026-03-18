import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/inputs/digit_input.dart';
import 'package:money_tracker/src/features/auth/models/verify_email.dart';
import 'package:money_tracker/src/features/auth/notifiers/email_verification_notifier.dart';

class VerifyEmailForm extends HookConsumerWidget {
  const VerifyEmailForm({super.key, required this.accountId, this.loading = false});

  final String accountId;
  final bool loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = useState('');

    return FormBuilder(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: AppDigitInput(onCompleted: (value) => code.value = value),
          ),
          SizedBox(height: context.dimensions.dim6.h),
          AppButton(
            text: 'ดำเนินการต่อ',
            loadingText: 'กำลังตรวจสอบ...',
            loading: loading,
            onPressed: () {
              ref
                  .read(emailVerificationProvider.notifier)
                  .verifyEmail(VerifyEmail(accountId: accountId, token: code.value));
            },
          ),
        ],
      ),
    );
  }
}
