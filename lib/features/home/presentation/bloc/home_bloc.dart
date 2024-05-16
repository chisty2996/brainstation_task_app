import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:brainstation_task_app/features/home/domain/usecases/get_home_item.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_event.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>  {
  final GetHomeItemUseCase getHomeItemUseCase;

  HomeBloc({required this.getHomeItemUseCase}):super(const HomeStateLoading()){
    on<GetItems>(onGetItems);
  }

  void onGetItems(HomeEvent event, Emitter<HomeState> emit) async{
    final dataState = await getHomeItemUseCase();
    List<HomeEntity> entities = dataState.data??[];
    if(dataState is DataSuccess && entities.isNotEmpty){
      emit( HomeStateFetched(entities));
    }

    if(dataState is DataFailed){
      emit(HomeStateError(dataState.dioException));
    }
  }
}