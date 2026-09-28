
import '../../../feature_occupation/domain/entity/occupation_entity.dart';

class ManageServiceEntity {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double priceMin;
  final double priceMax;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OccupationEntity? occupation;

  ManageServiceEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.priceMin,
    required this.priceMax,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.occupation,
  });

  String get name => title;
  String get imageUrl => images.isNotEmpty ? images.first : '';
}
