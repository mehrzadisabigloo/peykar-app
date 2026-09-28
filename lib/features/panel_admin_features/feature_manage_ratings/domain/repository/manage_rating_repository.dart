import '../../../../../../core/resources/data_state.dart';
import '../entity/manage_rating_entity.dart';

abstract class ManageRatingRepository {
  Future<DataState<ManageRatingListEntity>> fetchRatings({
    String? status,
    int page = 1,
    int perPage = 10,
  });

  Future<DataState<String>> changeRatingStatus(String ratingId);
}
