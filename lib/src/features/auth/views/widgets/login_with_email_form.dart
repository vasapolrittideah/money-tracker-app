import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/feedback/snackbar.dart';
import 'package:money_tracker/src/core/widgets/inputs/text_input.dart';
import 'package:money_tracker/src/features/auth/models/login_with_email.dart';
import 'package:money_tracker/src/features/auth/notifiers/auth_notifier.dart';

final _formKey = GlobalKey<FormBuilderState>();
final _emailTextInputKey = 'email';
final _passwordTextInputKey = 'password';

class LoginWithEmailForm extends HookConsumerWidget {
  const LoginWithEmailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final passwordHasError = useState(false);
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      next.whenOrNull(
        error: (error) {
          AppSnackbar.show(context, error.message, type: SnackbarType.error);
        },
      );
    });

    return FormBuilder(
      key: _formKey,
      onChanged: () {
        passwordHasError.value = _formKey.currentState?.fields[_passwordTextInputKey]?.hasError ?? false;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextInput(
            name: _emailTextInputKey,
            label: 'อีเมล',
            hint: 'กรอกอีเมลของคุณ',
            textInputAction: TextInputAction.next,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            validators: [FormBuilderValidators.required(errorText: 'กรุณากรอกอีเมล')],
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          SizedBox(height: context.dimensions.dim4.h),
          AppTextInput(
            name: _passwordTextInputKey,
            label: 'รหัสผ่าน',
            hint: 'กรอกรหัสผ่านของคุณ',
            focusNode: passwordFocusNode,
            obscureText: true,
            textInputAction: TextInputAction.done,
            validators: [
              FormBuilderValidators.required(errorText: 'กรุณากรอกรหัสผ่าน'),
              FormBuilderValidators.minLength(6, errorText: 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'),
            ],
            onSubmitted: (_) {
              passwordFocusNode.unfocus();
            },
          ),
          if (!passwordHasError.value) SizedBox(height: context.dimensions.dim4.h),
          AppButton(text: 'ลืมรหัสผ่าน?', variant: ButtonVariant.text, fullWidth: false, onPressed: () {}),
          SizedBox(height: context.dimensions.dim4.h),
          AppButton(
            text: 'เข้าสู่ระบบ',
            loadingText: 'กำลังเข้าสู่ระบบ...',
            loading: authState.isLoading,
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final formData = _formKey.currentState?.value;
                final request = LoginWithEmail(
                  email: formData?[_emailTextInputKey] as String,
                  password: formData?[_passwordTextInputKey] as String,
                );
                ref.read(authProvider.notifier).loginWithEmail(request);
              }
            },
          ),
        ],
      ),
    );
  }
}
