import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/inputs/text_input.dart';

final _formKey = GlobalKey<FormBuilderState>();
final _emailTextInputKey = 'email';
final _passwordTextInputKey = 'password';

class LoginWithEmailForm extends HookWidget {
  const LoginWithEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppTextInput(
            name: _emailTextInputKey,
            label: 'อีเมล',
            hint: 'กรอกอีเมลของคุณ',
            textInputAction: TextInputAction.next,
            focusNode: emailFocusNode,
            validators: [
              FormBuilderValidators.required(errorText: 'กรุณากรอกอีเมล'),
              FormBuilderValidators.email(errorText: 'รูปแบบอีเมลไม่ถูกต้อง'),
            ],
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
          SizedBox(height: context.dimensions.dim3.h),
          AppButton(
            text: 'ลืมรหัสผ่าน?',
            variant: ButtonVariant.text,
            fullWidth: false,
            size: ButtonSize.xsmall,
            onPressed: () {},
          ),
          SizedBox(height: context.dimensions.dim3.h),
          AppButton(
            text: 'เข้าสู่ระบบ',
            loadingText: 'กำลังเข้าสู่ระบบ...',
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final formData = _formKey.currentState?.value;
                print('Form Data: $formData');
              }
            },
          ),
        ],
      ),
    );
  }
}
