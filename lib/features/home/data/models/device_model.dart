import 'package:flutter/material.dart';

class DeviceModel {
  final int id;
  final String organizationName;
  final String serialNumber;
  final String softwareRelease;
  final DateTime? firstLaunch;
  final DateTime? lastUpdate;
  final String historyLength;
  final String status;
  Color get statusColor => _getStatusColor();
  DeviceModel({
    required this.id,
    required this.organizationName,
    required this.serialNumber,
    required this.softwareRelease,
    required this.firstLaunch,
    required this.lastUpdate,
    required this.historyLength,
    required this.status,
  });

  factory DeviceModel.fromJson(json) {
    return DeviceModel(
      id: json['id'],
      organizationName: json['organization_name'].toString(),
      serialNumber: json['serial_number'].toString(),
      softwareRelease: json['software_release'].toString(),
      firstLaunch: DateTime.tryParse(json['first_launch'].toString()),
      lastUpdate: DateTime.tryParse(json['last_update'].toString()),
      historyLength: json['history_length'].toString(),
      status: json['status'].toString(),
    );
  }

  Color _getStatusColor() {
    if (status == "Low_level.range50") {
      return Colors.orange;
    } else if (status == "Low_level.range30") {
      return Colors.deepOrangeAccent;
    } else if (status == "Low_level.quench") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
