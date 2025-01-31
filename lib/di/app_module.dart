import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../core/api/api_service.dart';
import '../domain/repository/auth/auth_data_cache.dart';
import '../features/account/config/my_account_module.dart';
import '../features/application_cubit.dart';
import '../features/auth/config/auth_module.dart';
import '../features/billing/config/billing_module.dart';
import '../features/consent_and_term/config/consent_and_term_module.dart';
import '../features/home/config/home_module.dart';
import '../features/loan_product/config/loan_product_module.dart';
import '../features/main_tab/config/main_tab_module.dart';
import '../features/manage_account/config/manage_account_module.dart';
import '../features/news_and_promotion/config/news_and_promotion_module.dart';
import '../features/notification/config/notification_module.dart';
import '../features/onboarding/config/onboarding_module.dart';
import '../features/passcode/config/passcode_module.dart';
import '../features/payment/config/payment_module.dart';
import '../features/service_center/config/service_center_module.dart';
import '../features/settings/config/settings_module.dart';
import '../features/splash/config/splash_module.dart';
import '../features/withdrawal/config/withdrawal_module.dart';
import '../theme/app_theme.dart';

var appModule = GetIt.instance;
var logger = Logger();

class AppModule {
  Future provideModule() async {
    final dio = await ApiService().initial();
    appModule.registerLazySingleton(
      () => dio,
    );
    appModule.registerLazySingleton(
      () => ApplicationCubit(),
    );
    appModule.registerLazySingleton(
      () => AppTheme(),
    );
    appModule.registerLazySingleton(
      () => AuthDataCache(),
    );

    SplashModule().provideModule();
    AuthModule().provideModule();
    HomeModule().provideModule();
    MyAccountModule().provideModule();
    NewsAndPromotionModule().provideModule();
    LoanProductModule().provideModule();
    OnboardingModule().provideModule();
    MainTabModule().provideModule();
    ConsentAndTermRouteModule().provideModule();
    PasscodeModule().provideModule();
    PaymentModule().provideModule();
    WithdrawalModule().provideModule();
    BillingModule().provideModule();
    NotificationModule().provideModule();
    SettingsModule().provideModule();
    ServiceCenterModule().provideModule();
    ManageAccountModule().provideModule();
  }
}
