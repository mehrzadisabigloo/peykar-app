import 'package:freezed_annotation/freezed_annotation.dart';
import 'manage_rating_model.dart';
import '../../domain/entity/manage_rating_entity.dart';

part 'manage_rating_list_model.freezed.dart';
part 'manage_rating_list_model.g.dart';

@freezed
sealed class ManageRatingListModel with _$ManageRatingListModel {
  const factory ManageRatingListModel({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<ManageRatingModel> data,
    @JsonKey(name: 'last_page') required int lastPage,
    required int total,
  }) = _ManageRatingListModel;

  const ManageRatingListModel._();

  factory ManageRatingListModel.fromJson(Map<String, dynamic> json) => _$ManageRatingListModelFromJson(json);

  ManageRatingListEntity toEntity() => ManageRatingListEntity(
    ratings: data.map((e) => e.toEntity()).toList(),
    currentPage: currentPage,
    lastPage: lastPage,
    total: total,
  );
}
