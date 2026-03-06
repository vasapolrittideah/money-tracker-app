import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:remixicon/remixicon.dart';

typedef ValidatorFunction = String? Function(String?);

class AppTextInput extends HookWidget {
  const AppTextInput({
    super.key,
    required this.name,
    required this.label,
    this.hint,
    this.initialValue,
    this.errorMessage,
    this.disabled = false,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validators,
  });

  final String name;
  final String label;
  final String? hint;
  final String? initialValue;
  final String? errorMessage;
  final bool disabled;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final AutovalidateMode autovalidateMode;
  final List<ValidatorFunction>? validators;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: initialValue);
    final focusNode = useFocusNode();
    final textObscured = useState(obscureText);
    final validationError = useState<String?>(null);
    useListenable<FocusNode>(focusNode);

    // Merge internal validation error with external errorMessage.
    // External errorMessage takes priority (e.g. server-side errors).
    final String? effectiveError = errorMessage ?? validationError.value;

    final Color effectiveBackgroundColor = () {
      if (disabled) return context.colors.bgSub200;
      return context.colors.bgWhite0;
    }();

    final Color effectiveBorderColor = () {
      if (effectiveError != null) return context.colors.errorBase;
      if (focusNode.hasFocus) return context.colors.borderStrong950;
      return context.colors.borderSub300;
    }();

    final Color effectiveLabelColor = () {
      if (effectiveError != null) return context.colors.errorBase;
      if (disabled) return context.colors.textSoft400;
      return context.colors.textStrong950;
    }();

    final List<BoxShadow>? effectiveShadow = () {
      if (!focusNode.hasFocus && !disabled) return context.shadows.sm;
    }();

    final ValidatorFunction? composedValidator = () {
      if (validators != null) {
        return (String? value) {
          final error = FormBuilderValidators.compose<String>(validators!)(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            validationError.value = error;
          });
          return error;
        };
      }
    }();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: context.dimensions.dim4.w),
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: context.borders.radiusMdAll,
            border: Border.all(color: effectiveBorderColor, width: 1),
            boxShadow: effectiveShadow,
          ),
          child: Row(
            children: [
              if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: context.dimensions.dim3.w)],
              Expanded(
                child: FormBuilderTextField(
                  key: key,
                  name: name,
                  enabled: !disabled,
                  readOnly: readOnly,
                  obscureText: textObscured.value,
                  keyboardType: keyboardType,
                  controller: textController,
                  focusNode: focusNode,
                  cursorColor: context.colors.textStrong950,
                  cursorErrorColor: context.colors.errorBase,
                  cursorWidth: 1,
                  autovalidateMode: autovalidateMode,
                  validator: composedValidator,
                  onTapOutside: (_) => focusNode.unfocus(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorText: null, // Disable default error text to use custom error display.
                    errorStyle: const TextStyle(fontSize: 0),
                    labelText: label,
                    labelStyle: context.typography.textBase.copyWith(color: effectiveLabelColor),
                    hintText: hint,
                    hintStyle: context.typography.textBase.copyWith(color: context.colors.textSoft400),
                  ),
                  style: context.typography.textBase.copyWith(color: context.colors.textStrong950),
                ),
              ),
              if (suffixIcon != null) ...[SizedBox(width: context.dimensions.dim3.w), suffixIcon!],
              if (obscureText) ...[
                SizedBox(width: context.dimensions.dim3.w),
                GestureDetector(
                  onTap: () => textObscured.value = !textObscured.value,
                  child: Icon(
                    size: context.dimensions.dim5.r,
                    textObscured.value ? RemixIcons.eye_line : RemixIcons.eye_off_line,
                    color: context.colors.textSoft400,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (effectiveError != null) ...[
          SizedBox(height: context.dimensions.dim1_5.h),
          Row(
            children: [
              Icon(RemixIcons.error_warning_line, size: context.dimensions.dim3.r, color: context.colors.errorBase),
              SizedBox(width: context.dimensions.dim1.w),
              Text(effectiveError, style: context.typography.textSmall.copyWith(color: context.colors.errorBase)),
            ],
          ),
        ],
      ],
    );
  }
}
