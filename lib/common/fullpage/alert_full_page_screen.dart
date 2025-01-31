import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_textstyle.dart';
import '../../theme/app_theme.dart';
import '../components/button/primary_button.dart';
import '../components/button/secondary_button.dart';
import '../components/text/app_text.dart';

/// final alert = AlertFullPageModel(
//             icon: Assets.icons.home.icHomeAlertLogout.image(
//               width: 85,
//               height: 85,
//             ),
//             title: errorDialogLabel?.errorLogoutTitle,
//             description: errorDialogLabel?.errorLogoutDescription,
//             buttonText: commonLabel?.buttonOk,
//             onButtonPressed: () {
//               navigator?.pop();
//             },
//           );
//
//           applicationCubit.showErrorFullPage(
//             errorFullPageModel: alert,
//           );

class AlertFullPageModel {
  final Widget icon;
  final String? title;
  final String? description;
  final String? buttonText;
  final String? cancelButtonText;
  final Function? onButtonPressed;
  final Function? onCancelButtonPressed;
  final bool? canDismiss;

  AlertFullPageModel({
    required this.icon,
    this.title,
    this.description,
    this.cancelButtonText,
    this.buttonText,
    this.onButtonPressed,
    this.onCancelButtonPressed,
    this.canDismiss = true,
  });
}

class AlertFullPageScreen extends StatelessWidget {
  final AlertFullPageModel? errorFullPageModel;

  const AlertFullPageScreen({
    super.key,
    this.errorFullPageModel,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: errorFullPageModel?.canDismiss ?? true,
      child: Scaffold(
        backgroundColor: AppColors.lightBG,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125,
                      height: 140,
                      child: errorFullPageModel?.icon,
                    ),
                    const SizedBox(height: 20),
                    AppText(
                      text: errorFullPageModel?.title ?? '',
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        height: 33.8.toFigmaHeight(26),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      text: errorFullPageModel?.description ?? '',
                      color: AppColors.textDescColor,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 23.97.toFigmaHeight(20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Builder(builder: (context) {
            if (errorFullPageModel?.onCancelButtonPressed != null) {
              return Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      title: errorFullPageModel?.cancelButtonText ?? '',
                      buttonStyle: AppTheme().primaryDialogButtonStyle,
                      onPressed: () => errorFullPageModel?.onCancelButtonPressed?.call(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PrimaryButton(
                      title: errorFullPageModel?.buttonText ?? '',
                      buttonStyle: AppTheme().primaryDialogButtonStyle,
                      onPressed: () => errorFullPageModel?.onButtonPressed?.call(),
                    ),
                  ),
                ],
              );
            } else {
              return PrimaryButton(
                title: errorFullPageModel?.buttonText ?? '',
                onPressed: () => errorFullPageModel?.onButtonPressed?.call(),
              );
            }
          }),
        ),
      ),
    );
  }
}
