import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_textstyle.dart';
import '../components/text/app_text.dart';

class AlertUIModel {
  final Widget icon;
  final String? title;
  final String? description;
  final List<Widget>? actionList;
  final bool canDismiss;

  AlertUIModel({
    required this.icon,
    required this.title,
    this.description,
    this.actionList = const [],
    this.canDismiss = false,
  });
}

class AppAlertDialog extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? description;
  final List<Widget>? actionList;
  final bool canDismiss;
  final Widget? descriptionWidget;
  final double? contentHorizontalPadding;
  final CrossAxisAlignment? contentCrossAxisAlignment;

  const AppAlertDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.canDismiss = false,
    this.actionList,
    this.descriptionWidget,
    this.contentHorizontalPadding = 12.0,
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canDismiss,
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        icon: icon,
        title: AppText(
          text: title,
          color: AppColors.textColor,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontFamily: "DefaultFont",
            fontSize: 24,
            height: 28.77.toFigmaHeight(24),
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: contentHorizontalPadding!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: contentCrossAxisAlignment!,
            children: [
              Builder(
                builder: (context) {
                  if (descriptionWidget != null) {
                    return descriptionWidget!;
                  } else {
                    if (description == null) {
                      return const SizedBox();
                    } else {
                      return AppText(
                        text: description,
                        color: AppColors.textDescColor,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontFamily: "DefaultFont",
                          fontSize: 16,
                          height: 19.18.toFigmaHeight(16),
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: actionList?.length == 1 ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
            children: actionList?.map(
                  (e) {
                    return e;
                  },
                ).toList() ??
                [],
          )
        ],
        iconPadding: const EdgeInsets.only(
          top: 29,
        ),
        titlePadding: const EdgeInsets.only(top: 3),
        contentPadding: const EdgeInsets.only(
          bottom: 29, // 29
          top: 6,
        ),
        actionsPadding: const EdgeInsets.only(
          bottom: 25,
        ),
      ),
    );
  }
}
