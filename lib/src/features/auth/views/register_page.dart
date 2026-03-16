import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/features/auth/views/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            context.dimensions.dim6.h,
            context.dimensions.dim4.w,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'สมัครสมาชิก',
                style: context.typography.textDisplay.copyWith(
                  color: context.colors.textStrong950,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.dimensions.dim4.h),
              Text(
                'กรอกข้อมูลของคุณเพื่อสร้างบัญชีใหม่',
                style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: context.dimensions.dim6.h),
              RegisterForm(),
              SizedBox(height: context.dimensions.dim6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'มีบัญชีอยู่แล้ว? ',
                    style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                  ),
                  AppButton(
                    text: 'เข้าสู่ระบบ',
                    variant: ButtonVariant.text,
                    size: ButtonSize.xsmall,
                    onPressed: () {
                      context.pushReplacement(AppRouter.loginWithEmail);
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
