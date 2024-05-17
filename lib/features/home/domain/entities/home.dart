import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int? id;
  final String? name;
  final int?  starCount;
  final OwnerEntity? ownerEntity;
  final String? lastUpdate;
  final String? description;
  final String? visibility;

  const HomeEntity({this.id, this.name, this.starCount, this.ownerEntity,this.lastUpdate, this.description, this.visibility});

  @override
  List<Object?> get props => [id, name, starCount, ownerEntity];
}

class OwnerEntity extends HomeEntity {
  final int? ownerId;
  final String? ownerName;
  final String? avatarUrl;

  const OwnerEntity({
    this.ownerId,
    this.avatarUrl,
    this.ownerName,
  });
}
