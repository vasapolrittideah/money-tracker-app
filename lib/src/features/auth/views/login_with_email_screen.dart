import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/features/auth/views/widgets/login_with_email_form.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      appBar: AppHeader(title: 'เข้าสู่ระบบด้วยอีเมล'),
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
                child: Column(mainAxisSize: MainAxisSize.min, children: [LoginWithEmailForm()]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.dimensions.dim8.h),
              child: AppButton(
                text: 'ยังไม่ได้เป็นสมาชิก? สมัครเลย',
                variant: ButtonVariant.text,
                size: ButtonSize.xsmall,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
