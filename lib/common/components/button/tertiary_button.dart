import 'package:flutter/material.dart';

import '../widget_condition/app_condition.dart';

class TertiaryButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;

  final double? height;

  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final Color textColor;
  final TextStyle? textStyle;

  final EdgeInsetsGeometry? padding;

  final ButtonStyle? buttonStyle;

  const TertiaryButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.onPressed,
    this.textStyle,
    this.height,
    this.leadingIcon,
    this.trailingIcon,
    this.padding,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: buttonStyle ??
            ButtonStyle(
              padding: WidgetStateProperty.all(padding),
            ),
        onPressed: onPressed != null ? () => onPressed?.call() : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            onCondition(
              condition: leadingIcon != null,
              builder: () => leadingIcon,
              fallback: () => const SizedBox(),
            ),
            Text(
              title ?? '',
            ),
            onCondition(
              condition: trailingIcon != null,
              builder: () => trailingIcon,
              fallback: () => const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
