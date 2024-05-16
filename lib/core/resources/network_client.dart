import 'package:brainstation_task_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient(this._dio){
    dio.options = BaseOptions(baseUrl: Constants.apiBaseUrl);
  }

  get dio => _dio;

}
