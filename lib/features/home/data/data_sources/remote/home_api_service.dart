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

  Future<DataState<List<HomeModel>>> getHomeItems()async{
    try{
      final response = await dio.get('/v2/everything?q=singapore&sortBy=publishedAt&apiKey=${Constants.apiKey}');
      log("api response: $response");
      log("api response data: ${response.data}");

      if(response.statusCode==200 || response.statusCode == 201){
        List<HomeModel> items = List<Map<String,dynamic>>.from(response.data["articles"]).map((e) => HomeModel.fromJson(e)).toList();
        return DataSuccess(items);
      }
    }
    on DioException catch(e){
      return DataFailed(e);
    }
    return DataFailed(DioException(requestOptions: RequestOptions()));
  }
}
