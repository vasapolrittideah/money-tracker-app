import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/layout/header.dart';
import 'package:money_tracker/src/features/auth/views/widgets/verify_email_form.dart';
import 'package:remixicon/remixicon.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite0,
      appBar: AppHeader(showLogo: true),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(
                context.dimensions.dim4.w,
                context.dimensions.dim8.h,
                context.dimensions.dim4.w,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'ยืนยันอีเมล',
                    style: context.typography.textDisplay.copyWith(
                      color: context.colors.textStrong950,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.dimensions.dim4.h),
                  Text(
                    'กรอกรหัสยืนยันที่ถูกส่งไปยังอีเมลของคุณ',
                    style: context.typography.textBase.copyWith(color: context.colors.textSub600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.dimensions.dim1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'test@example.com',
                        style: context.typography.textBase.copyWith(
                          color: context.colors.textStrong950,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: context.dimensions.dim1.w),
                      Icon(RemixIcons.pencil_line),
                    ],
                  ),
                  SizedBox(height: context.dimensions.dim10.h),
                  VerifyEmailForm(),
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
                          text: 'ส่งรหัสอีกครั้งใน 00:30',
                          variant: ButtonVariant.text,
                          fullWidth: false,
                          disabled: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
