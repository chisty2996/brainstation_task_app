import 'dart:developer';

import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/features/home/data/data_sources/remote/home_api_service.dart';
import 'package:brainstation_task_app/features/home/data/models/home_model.dart';
import 'package:brainstation_task_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  final HomeApiService _homeApiService;

  HomeRepositoryImpl(this._homeApiService);

  @override
  Future<DataState<List<HomeModel>>> getHomeItems() async{
    try{
      return await _homeApiService.getHomeItems();

    }
    catch(e,s){
      log(e.toString());
      log(s.toString());
    }
    return const DataSuccess([]);
  }
}