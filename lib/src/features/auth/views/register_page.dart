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
      appBar: AppHeader(title: 'สมัครสมาชิก'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(
                  context.dimensions.dim4.w,
                  context.dimensions.dim8.h,
                  context.dimensions.dim4.w,
                  0,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [RegisterForm()]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.dimensions.dim8.h),
              child: AppButton(
                text: 'มีบัญชีอยู่แล้ว? เข้าสู่ระบบ',
                variant: ButtonVariant.text,
                size: ButtonSize.xsmall,
                onPressed: () {
                  context.pushReplacement(AppRouter.loginWithEmail);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
