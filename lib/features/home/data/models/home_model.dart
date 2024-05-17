import 'package:brainstation_task_app/features/home/domain/entities/home.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    int? id,
    String? name,
    OwnerModel? ownerModel,
    int? starCount,
    String? description,
    String? visibility,
    String? lastUpdate,

  }) : super(
          id: id,
          name: name,
          ownerEntity: ownerModel,
          starCount: starCount,
          description: description,
          visibility: visibility,
    lastUpdate: lastUpdate,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ownerModel: OwnerModel.fromJson(json['owner']),
      starCount: json['stargazers_count'],
      description: json['description'],
      visibility: json['visibility'],
      lastUpdate:json["updated_at"],
    );
  }

  factory HomeModel.fromEntity(HomeEntity homeEntity) {
    return HomeModel(
      id: homeEntity.id,
      name: homeEntity.name,
      description: homeEntity.description,
    );
  }
}

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    int? ownerId,
    String? avatarUrl,
    String? ownerName,
  }) : super(ownerId: ownerId, avatarUrl: avatarUrl, ownerName: ownerName);

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      ownerId: json['id'],
      avatarUrl: json['avatar_url'],
      ownerName: json['login'],
    );
  }

  factory OwnerModel.fromEntity(OwnerEntity ownerEntity) {
    return OwnerModel(
      ownerId: ownerEntity.ownerId,
      avatarUrl: ownerEntity.avatarUrl,
    );
  }
}
