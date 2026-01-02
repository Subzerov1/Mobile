import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

class Failure {
  final String message;
  Failure({required this.message});

  factory Failure.defaultMessage() {
    return Failure(message: "DefaultErrorMessage".tr());
  }

  factory Failure.customErrorCode(String? code) {
    if (code != null) return Failure(message: code.tr());
    return Failure.defaultMessage();
  }

  factory Failure.server(DioException ex) {
    debugPrint("##########################################################");
    debugPrint("message: ${ex.message}");
    debugPrint("response: ${ex.response}");
    debugPrint("error: ${ex.error}");
    debugPrint("##########################################################");
    if (ex.response?.data['code'] != null) {
      return Failure.customErrorCode(ex.response!.data['code']);
    } else if (ex.response?.data['message'] != null) {
      return Failure.customErrorCode(ex.response!.data['message']);
    } else if (ex.response != null) {
      return Failure(message: ex.response!.data['message'] ?? "UnknownError".tr());
    } else if (ex.type == DioExceptionType.connectionError) {
      return Failure(message: "Please check your network connection");
    } else if (ex.type == DioExceptionType.cancel) {
      return Failure(message: "Your request has been canceled");
    } else if (ex.type == DioExceptionType.sendTimeout) {
      return Failure(message: "Looks like your internet very slow");
    } else if (ex.type == DioExceptionType.receiveTimeout) {
      return Failure(message: "Looks like your internet very slow");
    } else if (ex.type == DioExceptionType.connectionTimeout) {
      return Failure(message: "Looks like your internet very slow");
    } else if (ex.type == DioExceptionType.unknown) {
      return Failure.defaultMessage();
    }
    return Failure.defaultMessage();
  }
}
