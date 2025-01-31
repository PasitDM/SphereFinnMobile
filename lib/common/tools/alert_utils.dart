import 'dart:ui';

import 'package:get/get_navigation/get_navigation.dart';

import '../../delegate/localization_mixin.dart';
import '../../generator/assets.gen.dart';
import '../../theme/app_theme.dart';
import '../components/button/primary_button.dart';
import '../components/button/secondary_button.dart';
import '../components/images/app_image.dart';
import '../dialog/app_alert_dialog.dart';

class AlertUtils with LocalizationMixin {
  AlertUIModel createConfirmBackAlert({
    VoidCallback? onCancel,
    VoidCallback? onOk,
    String? title,
    String? desc,
  }) {
    return AlertUIModel(
      canDismiss: false,
      icon: AppImage(
        imageUrl: alertPopupLabel?.confirmCancellation?.image ?? Assets.stickers.stickLogout.path,
        width: 85,
        height: 85,
      ),
      title: title ?? alertPopupLabel?.confirmCancellation?.title,
      description: desc ?? alertPopupLabel?.confirmCancellation?.desc,
      actionList: [
        SecondaryButton(
          title: commonLabel?.buttonBack,
          buttonStyle: AppTheme().primaryDialogButtonStyle,
          onPressed: onCancel ??
              () {
                navigator?.pop();
              },
        ),
        PrimaryButton(
          title: commonLabel?.buttonConfirm,
          buttonStyle: AppTheme().primaryDialogButtonStyle,
          onPressed: onOk ??
              () {
                navigator?.pop();
                navigator?.pop();
              },
        ),
      ],
    );
  }

  AlertUIModel createOtpTimeOutAlert({
    required VoidCallback onOk,
  }) {
    return AlertUIModel(
      icon: AppImage(
        imageUrl: alertPopupLabel?.otpExpired?.image ?? Assets.stickers.stickSorry.path,
        width: 85,
        height: 85,
      ),
      title: alertPopupLabel?.otpExpired?.title,
      description: alertPopupLabel?.otpExpired?.desc,
      canDismiss: false,
      actionList: [
        PrimaryButton(
          title: alertPopupLabel?.otpExpired?.primaryButton,
          buttonStyle: AppTheme().primaryDialogButtonStyle,
          onPressed: onOk,
        ),
      ],
    );
  }
}
