import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/app_router.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/features/auth/views/widgets/login_method_button.dart';
import 'package:remixicon/remixicon.dart';

class SelectLoginMethodPage extends StatelessWidget {
  const SelectLoginMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      appBar: AppHeader(showLogo: true, goBackButton: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ยินดีต้อนรับ',
                      style: context.typography.text3XLarge.copyWith(
                        color: context.colors.textStrong950,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.dimensions.dim2.h),
                    Text(
                      'กรุณาเข้าสู่ระบบเพื่อจัดการการเงินของคุณ',
                      style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                    ),
                    SizedBox(height: context.dimensions.dim6.h),
                    LoginMethodButton(platform: SocialPlatform.apple, onPressed: () {}),
                    SizedBox(height: context.dimensions.dim3.h),
                    LoginMethodButton(platform: SocialPlatform.google, onPressed: () {}),
                    SizedBox(height: context.dimensions.dim3.h),
                    LoginMethodButton(platform: SocialPlatform.facebook, onPressed: () {}),
                    SizedBox(height: context.dimensions.dim3.h),
                    LoginMethodButton(platform: SocialPlatform.line, onPressed: () {}),
                    SizedBox(height: context.dimensions.dim3.h),
                    LoginMethodButton(
                      customMethod: (name: 'อีเมล', icon: Icon(RemixIcons.mail_line, size: context.dimensions.dim5.r)),
                      onPressed: () {
                        context.push(AppRouter.loginWithEmail);
                      },
                    ),
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
                            context.push(AppRouter.register);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
