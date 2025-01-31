import 'dart:convert';
import 'dart:io';
import 'dart:math' show cos, sqrt, asin;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

enum UrlType {
  phone,
  email,
  line,
  facebook,
  instagram,
  youtube,
  tiktok,
  website,
  other,
}

class Tools {
  static double? formatDouble(num? value) => value == null ? null : value * 1.0;

  /// check tablet screen
  static bool isTablet(MediaQueryData query) {
    var size = query.size;
    var diagonal = sqrt((size.width * size.width) + (size.height * size.height));
    var isTablet = diagonal > 1100.0;
    return isTablet;
  }

  static void showSnackBar(ScaffoldMessengerState? state, message) {
    if (state != null) {
      state.showSnackBar(SnackBar(content: Text(message)));
    }
  }

  static Future<void> launchMapsURL(dynamic lat, dynamic long) async {
    var googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await Tools.launchURL(googleUrl);
  }

  static Future<void> launchURL(
    String? url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    final uri = Uri.parse(url ?? '');
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchUrlService(String? link, UrlType type) async {
    if (link == null || link.isEmpty) return;

    String url;
    switch (type) {
      case UrlType.phone:
        url = 'tel:$link';
        break;
      case UrlType.email:
        url = 'mailto:$link';
        break;
      // case UrlType.line:
      //   url = 'https://line.me/R/ti/p/$link';
      //   break;
      // case UrlType.facebook:
      //   url = 'https://www.facebook.com/$link';
      //   break;
      // case UrlType.instagram:
      //   url = 'https://www.instagram.com/$link';
      //   break;
      // case UrlType.youtube:
      //   url = 'https://www.youtube.com/$link';
      //   break;
      // case UrlType.tiktok:
      //   url = 'https://www.tiktok.com/@$link';
      //   break;
      case UrlType.website:
      case UrlType.other:
      default:
        url = link;
        if (!url.startsWith('http://') && !url.startsWith('https://')) {
          url = 'https://$url';
        }
        break;
    }

    await Tools.launchURL(url);
  }

  static Future<dynamic> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then(jsonDecode);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool isRTL(BuildContext context) {
    return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
  }

  static String? convertDateTime(DateTime date) {
    return DateFormat.yMd().add_jm().format(date);
  }

  static String? getTimeWith2Digit(String time) {
    return time.length == 1 ? '0$time' : time;
  }

  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var distance = 12742 * asin(sqrt(a));
    return distance.roundToDouble();
  }

  static dynamic formatDate(String date) {
    var dateFormat = DateFormat(DateFormat.YEAR_MONTH_DAY);
    return dateFormat.format(DateTime.tryParse(date) ?? DateTime.now());
  }

  static dynamic formatDateToLocal(String date) {
    var dateFormat = DateFormat(DateFormat.YEAR_MONTH_DAY);
    return dateFormat.format(DateTime.tryParse(date)?.toLocal() ?? DateTime.now());
  }

  static bool validateStructurePassword(String value) {
    var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*()_:;\-{}[\]<>|`~]).{8,}$';
    var regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static Future<String> convertFileToBase64(String filePath) async {
    var file = File(filePath);
    List<int> bytes = await file.readAsBytes();
    var base64String = base64Encode(bytes);
    return base64String;
  }
}
