import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:money_tracker/src/core/widgets/buttons/button.dart';
import 'package:money_tracker/src/core/widgets/inputs/text_input.dart';
import 'package:remixicon/remixicon.dart';

final _formKey = GlobalKey<FormBuilderState>();
final _emailTextInputKey = 'email';
final _passwordTextInputKey = 'password';
final _nameTextInputKey = 'name';

class RegisterForm extends HookWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final nameFocusNode = useFocusNode();
    final passwordHasError = useState(false);

    return FormBuilder(
      key: _formKey,
      onChanged: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          passwordHasError.value = _formKey.currentState?.fields[_passwordTextInputKey]?.hasError ?? false;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              FormBuilderValidators.match(
                RegExp(r'(?=.*[a-zA-Z])(?=.*\d)'),
                errorText: 'รหัสผ่านต้องมีทั้งตัวอักษรและตัวเลข',
              ),
            ],
            onSubmitted: (_) {
              passwordFocusNode.unfocus();
            },
          ),
          if (!passwordHasError.value && _formKey.currentState?.fields[_passwordTextInputKey]?.value == null) ...[
            SizedBox(height: context.dimensions.dim1_5.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(RemixIcons.information_fill, size: context.dimensions.dim3.r, color: context.colors.textSub600),
                SizedBox(width: context.dimensions.dim1.w),
                Text(
                  'ต้องมีอย่างน้อย 6 ตัวอักษรและมีทั้งตัวอักษรและตัวเลข',
                  style: context.typography.textSmall.copyWith(color: context.colors.textSub600),
                ),
              ],
            ),
          ],
          SizedBox(height: context.dimensions.dim4.h),
          AppTextInput(
            name: _nameTextInputKey,
            label: 'ชื่อ',
            hint: 'กรอกชื่อของคุณ',
            required: false,
            textInputAction: TextInputAction.next,
            focusNode: nameFocusNode,
            validators: [FormBuilderValidators.required(errorText: 'กรุณากรอกชื่อ')],
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          SizedBox(height: context.dimensions.dim6.h),
          AppButton(
            text: 'สมัครสมาชิก',
            loadingText: 'กำลังสมัครสมาชิก...',
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
