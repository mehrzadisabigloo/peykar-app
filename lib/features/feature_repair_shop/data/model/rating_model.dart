import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../features/feature_appointments/data/model/reservation_model.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
sealed class RatingModel with _$RatingModel {
  const factory RatingModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'repairman_id') required String repairmanId,
    String? description,
    required int score,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'created_at_jalali') String? createdAtJalali,
    required ReservationUserModel user,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}

@freezed
sealed class RatingListModel with _$RatingListModel {
  const factory RatingListModel({
    required List<RatingModel> data,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    required int total,
  }) = _RatingListModel;

  factory RatingListModel.fromJson(Map<String, dynamic> json) => _$RatingListModelFromJson(json);
}
