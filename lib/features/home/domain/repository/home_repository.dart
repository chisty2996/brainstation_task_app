import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/features/home/domain/entities/home.dart';

abstract class HomeRepository{

  Future<DataState<List<HomeEntity>>> getHomeItems(int pageNo);
}