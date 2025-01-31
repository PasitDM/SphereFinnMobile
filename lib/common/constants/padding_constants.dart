import 'package:flutter/material.dart';

class PaddingConstants {
  static EdgeInsets getPaddingAboveKeyboard(BuildContext context,
      {double extraBottomPadding = 30}) {
    return EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom + extraBottomPadding,
      left: 20,
      right: 20,
      top: 20,
    );
  }

  static const EdgeInsets authPaddingTop = EdgeInsets.only(
    left: 20,
    right: 20,
    top: 80,
  );

  static const EdgeInsets defaultPadding = EdgeInsets.only(
    left: 20,
    right: 20,
    top: 15,
  );
}
