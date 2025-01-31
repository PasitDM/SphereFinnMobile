import 'package:flutter/material.dart';

import '../../../theme/index.dart';
import '../widget_condition/app_condition.dart';

class SecondaryButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;

  final double? height;

  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final ButtonStyle? buttonStyle;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.leadingIcon,
    this.trailingIcon,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed != null ? () => onPressed?.call() : null,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          onCondition(
            condition: leadingIcon != null,
            builder: () => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: leadingIcon,
            ),
            fallback: () => const SizedBox(),
          ),
          Text(
            title ?? "n/a",
            textAlign: TextAlign.center,
            style: AppTextStyle.iconText.copyWith(
              color: AppColors.textColor,
            ),
          ),
          onCondition(
            condition: trailingIcon != null,
            builder: () => Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: trailingIcon,
            ),
            fallback: () => const SizedBox(),
          )
        ],
      ),
    );
  }
}
