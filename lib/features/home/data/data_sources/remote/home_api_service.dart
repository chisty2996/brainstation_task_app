import 'dart:developer';
import 'dart:io';

import 'package:brainstation_task_app/core/constants/constants.dart';
import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/features/home/data/models/home_model.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService({
    required this.dio,
  });

  Future<DataState<List<HomeModel>>> getHomeItems(int pageNo) async {
    try {
      final response = await dio.get('/search/repositories', queryParameters: {
        'q': 'Flutter',
        'sort': 'stars',
        'page': pageNo,
      });
      log("api response: $response");
      log("api response data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<HomeModel> items = List<Map<String, dynamic>>.from(response.data["items"])
            .map((e) => HomeModel.fromJson(e))
            .toList();
        return DataSuccess(items);
      }
      else{
        return DataFailed(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Unexpected status code: ${response.statusCode}",
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
    catch(e){
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: '/search/repositories'),
        type: DioExceptionType.unknown,
        error: e.toString(),
      ));
    }
    return DataFailed(DioException(requestOptions: RequestOptions()));
  }
}
