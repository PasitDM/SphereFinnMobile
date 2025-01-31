import 'package:intl/intl.dart';

import '../core/configuration/language_config.dart';
import '../di/app_module.dart';
import '../features/application_cubit.dart';

enum DateFormatPattern {
  monthYear("MMM yyyy"),
  dayMonthYear("dd MMM yyyy"),
  dayMonthYearWithSlash("dd/MM/yyyy"),
  
  ;

  final String value;

  const DateFormatPattern(this.value);
}

extension FormatDateExtension on DateTime {
  String formatDateTime(
    DateFormatPattern pattern, {
    String? locale,
  }) {
    final applicationCubit = appModule.get<ApplicationCubit>();

    if (applicationCubit.isEnglishLanguage()) {
      return DateFormat(pattern.value, LanguageConfig.english.code)
          .format(this);
    } else {
      final year = this.year + 543;
      var newPattern = '';
      if (pattern == DateFormatPattern.dMyHm ||
          pattern == DateFormatPattern.dMyHms ||
          pattern == DateFormatPattern.time) {
        newPattern = '${pattern.value} น.';
      } else {
        newPattern = pattern.value;
      }
      return DateFormat(newPattern, LanguageConfig.thai.code)
          .format(
            DateTime(
              this.year,
              month,
              day,
              hour,
              minute,
              second,
            ),
          )
          .replaceAll('${this.year}', '$year');
    }
  }
}
