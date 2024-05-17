import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  final List<HomeEntity>? homeItems;
  final DioException? dioException;

  const HomeState({this.homeItems, this.dioException});

  @override
  List<Object?> get props => [homeItems, dioException];
}

class HomeStateLoading extends HomeState{
  const HomeStateLoading();
}

class HomeStateFetched extends HomeState{
  const HomeStateFetched(List<HomeEntity> items): super(homeItems: items);
}

class HomeStateError extends HomeState{
 const HomeStateError(DioException? dioException): super(dioException: dioException);
}

class HomeStateFiltered extends HomeState {
  final List<HomeEntity> filteredItems;

  const HomeStateFiltered({required this.filteredItems});

}

class HomeStateLoadingMore extends HomeState {
  final List<HomeEntity> currentItems;

  const HomeStateLoadingMore(this.currentItems) : super(homeItems: currentItems);

  @override
  List<Object?> get props => [currentItems];
}