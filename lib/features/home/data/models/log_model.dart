import 'package:flutter/material.dart';

class LogModel {
  final int id;
  final DateTime? date;
  final String percentage;
  Color get statusColor => _getStatusColor();
  LogModel({
    required this.id,
    required this.date,
    required this.percentage,
  });

  factory LogModel.fromJson(json) {
    return LogModel(
      id: json['id'],
      date: DateTime.tryParse(json['datetime'].toString()),
      percentage: json['percentage'].toString(),
    );
  }

  Color _getStatusColor() {
    double per = double.parse(percentage);
    if (per < 30) {
      return Colors.red;
    } else if (per < 50) {
      return Colors.deepOrange;
    } else if (per < 80) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
