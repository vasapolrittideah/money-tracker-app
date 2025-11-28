import 'package:auth/generated/locale_keys.g.dart';
import 'package:auth/src/view/auth_router.dart';
import 'package:auth/src/view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:shared/libs.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key, this.initialEmailValue = '', this.initialPasswordValue = ''});

  final String initialEmailValue;
  final String initialPasswordValue;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: context.appColors.staticWhite,
          resizeToAvoidBottomInset: false,
          appBar: AppHeader(
            leading: SvgPicture.asset(UiAssets.images.brand, width: 24.w, height: 24.h),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.appSpacing.s24),
                child: Column(
                  children: [
                    SizedBox(height: context.appSpacing.s32),
                    Text(
                      AuthLocaleKeys.login_title.tr(),
                      style: context.appTypography.bold.t28.copyWith(color: context.appColors.textStrong950),
                    ),
                    Text(
                      AuthLocaleKeys.login_subtitle.tr(),
                      style: context.appTypography.regular.base.copyWith(color: context.appColors.textSub600),
                    ),
                    SizedBox(height: context.appSpacing.s32),

                    LoginForm(
                      key: const Key('login_form'),
                      initialEmailValue: initialEmailValue,
                      initialPasswordValue: initialPasswordValue,
                    ),
                    AppButton(
                      text: AuthLocaleKeys.login_registerLink.tr(),
                      fullWidth: true,
                      mode: AppButtonMode.ghost,
                      onTap: () => context.go(AuthRouteName.register),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
