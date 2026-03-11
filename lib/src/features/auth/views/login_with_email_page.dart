import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/features/auth/views/widgets/login_with_email_form.dart';

class LoginWithEmailPage extends StatelessWidget {
  const LoginWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      appBar: AppHeader(showLogo: true),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.fromLTRB(
            context.dimensions.dim4.w,
            context.dimensions.dim8.h,
            context.dimensions.dim4.w,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'เข้าสู่ระบบด้วยอีเมล',
                style: context.typography.textDisplay.copyWith(
                  color: context.colors.textStrong950,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.dimensions.dim4.h),
              Text(
                'กรอกอีเมลและรหัสผ่านของคุณเพื่อเข้าสู่ระบบ',
                style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: context.dimensions.dim10.h),
              LoginWithEmailForm(),
              SizedBox(height: context.dimensions.dim6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ยังไม่ได้เป็นสมาชิก? ',
                    style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                  ),
                  AppButton(
                    text: 'สมัครเลย',
                    variant: ButtonVariant.text,
                    size: ButtonSize.xsmall,
                    onPressed: () {
                      context.pushReplacement(AppRouter.register);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
