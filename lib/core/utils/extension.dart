import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtention<T> on BuildContext {
  String get lang => locale.languageCode;
  GoRouter get router => GoRouter.of(this);
  TextTheme get texts => TextTheme.of(this);
  ColorScheme get colors => ColorScheme.of(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Future<T?> dialog(Widget child, [bool? dismissible]) {
    return showDialog<T?>(
      context: this,
      builder: (context) => child,
      barrierDismissible: dismissible ?? false,
    );
  }
}

extension DateTimeExtention on DateTime {
  String formate([String? l]) => DateFormat('dd MMMM yyyy', l).format(this);
  String formateMonth([String? l]) => DateFormat('MMMM yyyy', l).format(this);
  String dayName([String? l]) => DateFormat('EEEE', l).format(this);
  String time([String? l]) => DateFormat('hh:mm:ss a', l).format(this);
  String server() => DateFormat('yyyy-MM-dd').format(this);
}

extension TimeExtention on TimeOfDay {
  String formatTime(BuildContext context) {
    return MaterialLocalizations.of(context).formatTimeOfDay(this, alwaysUse24HourFormat: false);
  }

  bool isBetween(TimeOfDay start, TimeOfDay end) {
    DateTime now = DateTime.now().copyWith(second: 0, microsecond: 0, millisecond: 0);
    DateTime currentTime = now.copyWith(hour: hour, minute: minute);
    DateTime startTime = now.copyWith(hour: start.hour, minute: start.minute);
    DateTime endTime = now.copyWith(hour: end.hour, minute: end.minute);
    return currentTime.isAfter(startTime) && currentTime.isBefore(endTime);
  }
}

extension MapExtention on Map<String, String> {
  String lang(String locale) => this[locale] ?? this['en'] ?? "";
}

extension StringExtention on String {
  double? get toDouble => double.tryParse(this);
  int? get toInt => int.tryParse(this);

  TimeOfDay toTime() {
    final List<String> formattedData = split(':');
    final int hour = int.parse(formattedData[0]);
    final int minute = int.parse(formattedData[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
