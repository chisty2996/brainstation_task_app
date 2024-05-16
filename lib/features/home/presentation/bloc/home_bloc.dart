import 'dart:developer';

import 'package:brainstation_task_app/core/resources/data_state.dart';
import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:brainstation_task_app/features/home/domain/usecases/get_home_item.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_event.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>  {
  final GetHomeItemUseCase getHomeItemUseCase;
  List<HomeEntity> previousItems = [];

  HomeBloc({required this.getHomeItemUseCase}):super(const HomeStateLoading()){
    on<GetItems>(onGetItems);
    on<FilterItems>(onFilterItems);
  }

  void onGetItems(HomeEvent event, Emitter<HomeState> emit) async{
    log("previous items: ${previousItems.length}");
    if (previousItems.isNotEmpty) {
      emit(HomeStateFetched(previousItems)); // Emit previously fetched data
      return;
    }
    final dataState = await getHomeItemUseCase();
    List<HomeEntity> entities = dataState.data??[];
    if(dataState is DataSuccess && entities.isNotEmpty){
      previousItems = entities;
      emit( HomeStateFetched(entities));
    }

    else if(dataState is DataFailed){
      emit(HomeStateError(dataState.dioException));
    }
    else {
      emit(const HomeStateFetched([])); // Emit an empty list if there's no data
    }
  }

  void onFilterItems(FilterItems event, Emitter<HomeState> emit) {
    final currentState = state;
    if (currentState is HomeStateFetched || currentState is HomeStateFiltered) {
      final List<HomeEntity> items = (currentState is HomeStateFiltered)
          ? currentState.filteredItems
          : (currentState as HomeStateFetched).homeItems ?? [];
      final filteredItems = items
          .where((item) =>
          (item.title??"").toLowerCase().contains(event.keyword.toLowerCase()))
          .toList();
      emit(HomeStateFiltered(filteredItems: filteredItems));
    }
  }
}