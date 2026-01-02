import 'package:dio/dio.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';

class API {
  static final instance = API._internal();
  API._internal();
  late Dio _dio;
  final _basUrl = "https://subzero.fly.dev/api";
  final Map<String, String?> headers = {
    "Accept": "application/json",
    "timezone": "Africa/Cairo",
    "Authorization": "Bearer ${HiveService.instance.user?.accessToken}",
  };

  void init() {
    headers["Authorization"] = "Bearer ${HiveService.instance.user?.accessToken}";
    _dio = Dio(BaseOptions(baseUrl: _basUrl, headers: headers));
  }

  void authorize() {
    headers['Authorization'] = "Bearer ${HiveService.instance.user!.accessToken}";
    _dio.options.headers = headers;
  }

  Future<Response> get(APIData data) async {
    final Response response =
        await _dio.get(data.url, data: data.body, queryParameters: data.prams);
    return response;
  }

  Future<Response> post(APIData data) async {
    final Response response = await _dio.post(data.url, data: data.body);
    return response;
  }

  Future<Response> patch(APIData data) async {
    final Response response = await _dio.patch(data.url, data: data.body);
    return response;
  }

  Future<Response> delete(APIData data) async {
    final Response response = await _dio.delete(data.url, data: data.body);
    return response;
  }

  Future<Response> form(APIData data) async {
    final Response response = await _dio.post(data.url, data: data.form);
    return response;
  }
}

class APIData {
  final String url;
  final FormData? form;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? prams;
  final Map<String, dynamic>? headers;
  APIData({required this.url, this.form, this.body, this.prams, this.headers});
}
