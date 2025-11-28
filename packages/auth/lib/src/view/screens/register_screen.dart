import 'package:auth/generated/locale_keys.g.dart';
import 'package:auth/src/view/auth_router.dart';
import 'package:auth/src/view/widgets/register_form.dart';
import 'package:auth/src/view/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:shared/libs.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key, this.initialEmailValue = '', this.initialPasswordValue = ''});

  final String initialEmailValue;
  final String initialPasswordValue;

  @override
  Widget build(BuildContext context) {
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
                  AuthLocaleKeys.register_title.tr(),
                  style: context.appTypography.bold.t28.copyWith(color: context.appColors.textStrong950),
                ),
                Text(
                  AuthLocaleKeys.register_subtitle.tr(),
                  style: context.appTypography.regular.base.copyWith(color: context.appColors.textSub600),
                ),
                SizedBox(height: context.appSpacing.s32),

                // Social Buttons
                // const AppSocialButton(provider: AppSocialButtonProvider.apple),
                // SizedBox(height: context.appSpacing.x3s),
                AppSocialButton(provider: AppSocialButtonProvider.facebook, onTap: () {}),
                SizedBox(height: context.appSpacing.s12),
                AppSocialButton(provider: AppSocialButtonProvider.google, onTap: () {}),

                AppDivider(
                  padding: EdgeInsets.symmetric(vertical: context.appSpacing.s24),
                  text: AuthLocaleKeys.login_orDivider.tr(),
                ),

                RegisterForm(
                  key: const Key('register_form'),
                  initialEmailValue: initialEmailValue,
                  initialPasswordValue: initialPasswordValue,
                ),
                AppButton(
                  text: AuthLocaleKeys.register_loginLink.tr(),
                  fullWidth: true,
                  mode: AppButtonMode.ghost,
                  onTap: () => context.go(AuthRouteName.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
