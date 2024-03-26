import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

enum RequestType { get, post, put, delete }

@lazySingleton
class DioClient {
  final Dio _dio = Dio();
  late Response response;
  DioClient() {
    _dio
      ..options.connectTimeout =  const Duration(seconds: 5)
      ..options.receiveTimeout =  const Duration(seconds: 5)
      ..httpClientAdapter
      ..options.responseType = ResponseType.json;
  }
  Future<dynamic> performCall({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? queryParameters,
    data,
    Options? options,
  }) async {
    late Response response;
    queryParameters = queryParameters == null || queryParameters.isEmpty
        ? {}
        : queryParameters;
    data = data == null || data.isEmpty ? {} : data;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case RequestType.post:
          response = await _dio.post(url,
              options: options, queryParameters: queryParameters, data: data);
          break;
        case RequestType.put:
          response =
          await _dio.put(url, queryParameters: queryParameters, data: data);
          break;
        case RequestType.delete:
          response = await _dio.delete(url, queryParameters: queryParameters);
          break;
      }
    } on PlatformException catch (err) {
      dev.log("platform exception happened: $err");
    } catch (error) {
      dev.log(error.toString());
    }
    if (response.statusCode == 200) {
      return response;
    }
  }
}