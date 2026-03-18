import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_tracker/src/core/gen/fonts.gen.dart';
import 'package:money_tracker/src/core/theme/theme_provider.dart';
import 'package:pinput/pinput.dart';

class AppDigitInput extends HookWidget {
  const AppDigitInput({super.key, this.onCompleted});

  final void Function(String)? onCompleted;

  static const _length = 6;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pinWidth = constraints.maxWidth / _length;

        final defaultPinTheme = PinTheme(
          width: pinWidth,
          height: context.dimensions.dim14.r,
          textStyle: context.typography.text3XLarge.copyWith(height: 1, fontFamily: FontFamily.geistMono),
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.borderSub300),
            borderRadius: context.borders.radiusMdAll,
          ),
        );

        final focusedPinTheme = defaultPinTheme.copyDecorationWith(
          border: Border.all(color: context.colors.primaryBase),
          borderRadius: context.borders.radiusMdAll,
        );

        final submittedPinTheme = defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration?.copyWith(color: context.colors.bgSub200),
        );

        return Pinput(
          length: _length,
          pinAnimationType: PinAnimationType.scale,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: context.dimensions.dim2.h),
                width: context.dimensions.dim5.w,
                height: 1,
                color: context.colors.textSub600,
              ),
            ],
          ),
          animationDuration: Duration(milliseconds: 100),
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          keyboardType: TextInputType.number,
          autofillHints: [AutofillHints.oneTimeCode],
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onCompleted: onCompleted,
        );
      },
    );
  }
}
