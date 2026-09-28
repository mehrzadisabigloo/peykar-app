import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../feature_home/data/model/user_model.dart';
import '../../domain/entity/manage_rating_entity.dart';

part 'manage_rating_model.freezed.dart';
part 'manage_rating_model.g.dart';

@freezed
sealed class ManageRatingModel with _$ManageRatingModel {
  const factory ManageRatingModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'repairman_id') required String repairmanId,
    required String description,
    required int score,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'created_at_jalali') String? createdAtJalali,
    UserModel? user,
  }) = _ManageRatingModel;

  const ManageRatingModel._();

  factory ManageRatingModel.fromJson(Map<String, dynamic> json) => _$ManageRatingModelFromJson(json);

  ManageRatingEntity toEntity() => ManageRatingEntity(
    id: id,
    userId: userId,
    repairmanId: repairmanId,
    description: description,
    score: score,
    status: status,
    createdAt: createdAt,
    createdAtJalali: createdAtJalali,
    user: user?.toEntity(),
  );
}
