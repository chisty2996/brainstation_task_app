import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/core/usecase/use_case.dart';
import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:brainstation_task_app/features/home/domain/repository/home_repository.dart';

class GetHomeItemUseCase{
  final HomeRepository homeRepository;

  GetHomeItemUseCase({required this.homeRepository});

  Future<DataState<List<HomeEntity>>> call(int pageNo){
    return homeRepository.getHomeItems(pageNo);
  }
}