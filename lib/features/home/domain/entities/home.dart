import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable{
  final String? title;
  final String? subTitle;
  final String? details;

  const HomeEntity({this.title, this.subTitle, this.details});

  @override
  List<Object?> get props => [title, subTitle, details];
}