import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/feedback/alert_dialog.dart';
import 'package:money_tracker/src/core/widgets/feedback/loading_indicator.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/core/widgets/overlays/dialog.dart';
import 'package:money_tracker/src/features/account/notifiers/account_notifier.dart';
import 'package:money_tracker/src/features/auth/notifiers/email_verification_notifier.dart';
import 'package:money_tracker/src/features/auth/views/widgets/verify_email_form.dart';
import 'package:remixicon/remixicon.dart';

const resendCooldown = 30;

class VerifyEmailPage extends HookConsumerWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final countdown = useState(resendCooldown);
    final emailVerificationState = ref.watch(emailVerificationProvider);

    useEffect(() {
      countdown.value = resendCooldown;
      final timer = Stream.periodic(
        const Duration(seconds: 1),
        (i) => resendCooldown - i - 1,
      ).take(resendCooldown).listen((value) => countdown.value = value);
      return timer.cancel;
    }, const []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        accountState.whenOrNull(
          data: (account) {
            // ref.read(emailVerificationProvider.notifier).sendVerificationEmail();
          },
          error: (error) {
            AppDialog.show(
              context: context,
              child: AppAlertDialog(
                title: 'เกิดข้อผิดพลาด',
                message: error.message,
                buttonText: 'ลองใหม่อีกครั้ง',
                type: AlertDialogType.error,
                onButtonPressed: () {
                  ref.read(accountProvider.notifier).loadAccount();
                },
              ),
            );
          },
        );
      });

      return null;
    }, [accountState]);

    ref.listen(emailVerificationProvider, (previous, next) {
      next.whenOrNull(
        error: (error) {
          AppDialog.show(
            context: context,
            child: AppAlertDialog(
              title: 'เกิดข้อผิดพลาด',
              message: error.message,
              buttonText: 'ลองใหม่อีกครั้ง',
              type: AlertDialogType.error,
              onButtonPressed: () {
                ref.read(emailVerificationProvider.notifier).sendVerificationEmail();
              },
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      appBar: AppHeader(title: 'ยืนยันอีเมล'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            accountState.maybeWhen(
              data: (account) => SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(
                  context.dimensions.dim4.w,
                  context.dimensions.dim4.h,
                  context.dimensions.dim4.w,
                  0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'กรอกรหัสยืนยันที่ถูกส่งไปยังอีเมลของคุณ',
                      style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: context.dimensions.dim1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          account.email,
                          style: context.typography.textBase.copyWith(
                            color: context.colors.textStrong950,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: context.dimensions.dim1.w),
                        Icon(RemixIcons.pencil_line),
                      ],
                    ),
                    SizedBox(height: context.dimensions.dim6.h),
                    VerifyEmailForm(accountId: account.id, loading: emailVerificationState.isLoading),
                    SizedBox(height: context.dimensions.dim6.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ไม่ได้รับรหัสยืนยัน? ',
                          style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                        ),
                        SizedBox(height: context.dimensions.dim1.h),
                        Align(
                          alignment: Alignment.center,
                          child: AppButton(
                            text: countdown.value > 0
                                ? 'ส่งรหัสอีกครั้งใน 00:${countdown.value.toString().padLeft(2, '0')}'
                                : 'ส่งรหัสอีกครั้ง',
                            variant: ButtonVariant.text,
                            fullWidth: false,
                            disabled: countdown.value > 0,
                            onPressed: () {
                              countdown.value = resendCooldown;
                              Stream.periodic(
                                const Duration(seconds: 1),
                                (i) => resendCooldown - i - 1,
                              ).take(resendCooldown).listen((v) => countdown.value = v);
                              ref.read(emailVerificationProvider.notifier).sendVerificationEmail();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              orElse: () => Expanded(child: Center(child: AppLoadingIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
