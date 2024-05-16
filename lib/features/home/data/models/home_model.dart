import 'package:brainstation_task_app/features/home/domain/entities/home.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    String? title,
    String? subTitle,
    String? details,
  }) : super(
          title: title,
          subTitle: subTitle,
          details: details,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      title: json['title'] ?? '',
      subTitle: json['subtitle'] ?? '',
      details: json['details'] ?? '',
    );
  }

  factory HomeModel.fromEntity(HomeEntity homeEntity) {
    return HomeModel(
      title: homeEntity.title,
      subTitle: homeEntity.subTitle,
      details: homeEntity.details,
    );
  }
}
