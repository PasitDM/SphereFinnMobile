import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../delegate/application_mixin.dart';
import '../../delegate/config_mixin.dart';
import '../../delegate/localization_mixin.dart';
import '../../features/application_cubit.dart';
import '../../theme/app_colors.dart';
import 'app_cubit.dart';

abstract class AppState<Screen extends StatefulWidget, PageCubit extends AppCubit> extends State<Screen>
    with LocalizationMixin, TickerProviderStateMixin, WidgetsBindingObserver, ApplicationMixin, ConfigMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageCubit? pageCubit;

  Widget body();

  PreferredSizeWidget? appBar;

  Widget? bottomNavigationBar;

  Function? onCubitReady;

  @protected
  Widget? floatingActionButton;
  @protected
  FloatingActionButtonLocation? floatingActionButtonLocation;

  @protected
  bool get focusScopeEnabled => false;

// Optional: Define a callback for the system back button press
  @protected
  bool get canPop => true;

  @protected
  Function? get onWillPopCallback => null;

  @protected
  bool? get resizeToAvoidBottomInset => null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        pageCubit = context.read<PageCubit>()
          ..init(
            arguments: Get.arguments,
          );
        onCubitReady?.call();
      } catch (e) {
        debugPrint('$e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop && onWillPopCallback == null,
      onPopInvoked: (bool didPop) {
        debugPrint('didPop: $didPop');
        if (didPop) {
          return;
        }

        if (onWillPopCallback != null) {
          onWillPopCallback?.call();
        }
      },
      child: GestureDetector(
        onTap: focusScopeEnabled
            ? () {
                FocusScope.of(context).requestFocus(FocusNode());
                // เพิ่ม reset, start เพราะว่าการกด tapdown ตรง main จะใช้ไม่ได้ๆ เลยต้องเรียกใหม่
                context.read<ApplicationCubit>()
                  ..resetSessionTimeout()
                  ..startTimer();
              }
            : null,
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: AppColors.lightBG,
          appBar: appBar,
          key: scaffoldKey,
          body: body(),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageCubit?.clear();
    super.dispose();
  }
}
