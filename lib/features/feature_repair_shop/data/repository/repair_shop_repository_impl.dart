import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';
import '../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../../feature_manage_services/data/model/manage_services_model.dart';
import '../../../feature_appointments/data/model/reservation_model.dart';
import '../../../feature_appointments/domain/entity/appointments_entity.dart';
import '../../domain/entity/repair_shop_entity.dart';
import '../../domain/repository/repair_shop_repository.dart';
import '../data_source/remote/repair_shop_api_provider.dart';
import '../model/rating_model.dart';
import '../model/repairman_details_model.dart';

class RepairShopRepositoryImpl extends RepairShopRepository {
  final RepairShopApiProvider _apiProvider;
  RepairShopRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<RepairShopEntity>> fetchRepairShopData(String repairmanId) async {
    try {
      // Fetch everything in parallel
      final results = await Future.wait([
        _apiProvider.getRepairShopData(repairmanId),
        _apiProvider.getActiveProducts(repairmanId: repairmanId),
        _apiProvider.getActiveServices(repairmanId: repairmanId),
        _apiProvider.getUserReservationsForRepairman(repairmanId: repairmanId),
      ]);

      final dynamic detailsResponse = results[0];
      final dynamic productsResponse = results[1];
      final dynamic servicesResponse = results[2];
      final dynamic reservationsResponse = results[3];

      if (detailsResponse is Response && detailsResponse.statusCode == 200) {
        final detailsData = detailsResponse.data;
        if (detailsData is Map && detailsData['success'] == true) {
          final model = RepairmanDetailsModel.fromJson(detailsData['data']);
          final entity = model.toEntity();

          // Parse products
          List<ManageProductsModel> products = [];
          String? productsError;
          if (productsResponse is Response && productsResponse.statusCode == 200) {
            final pBody = productsResponse.data;
            if (pBody is Map && pBody['success'] == true) {
              final pData = pBody['data'];
              final pItems = (pData is Map) ? pData['data'] : pData;
              if (pItems is List) {
                products = pItems
                    .whereType<Map<String, dynamic>>()
                    .map((e) => ManageProductsModel.fromJson(e))
                    .where((p) => p.repairmanId == repairmanId)
                    .toList();
              }
            } else {
              productsError = pBody is Map ? pBody['message'] : "خطا در دریافت محصولات";
            }
          }

          // Parse services
          List<ManageServicesModel> services = [];
          String? servicesError;
          if (servicesResponse is Response && servicesResponse.statusCode == 200) {
            final sBody = servicesResponse.data;
            if (sBody is Map && sBody['success'] == true) {
              final sData = sBody['data'];
              final sItems = (sData is Map) ? sData['data'] : sData;
              if (sItems is List) {
                services = sItems
                    .whereType<Map<String, dynamic>>()
                    .map((e) => ManageServicesModel.fromJson(e))
                    .where((s) => s.repairmanId == repairmanId)
                    .toList();
              }
            } else {
              servicesError = sBody is Map ? sBody['message'] : "خطا در دریافت سرویس‌ها";
            }
          }

          // Parse reservations
          List<AppointmentsEntity> reservations = [];
          String? reservationsError;
          if (reservationsResponse is Response && reservationsResponse.statusCode == 200) {
            final rBody = reservationsResponse.data;
            if (rBody is Map && rBody['success'] == true) {
              final rData = rBody['data'];
              final rItems = (rData is Map) ? rData['data'] : rData;
              if (rItems is List) {
                reservations = rItems
                    .whereType<Map<String, dynamic>>()
                    .map((e) => ReservationModel.fromJson(e).toEntity())
                    .toList();
              }
            } else {
              reservationsError = rBody is Map ? rBody['message'] : "خطا در دریافت رزروها";
            }
          }

          return DataSuccess(RepairShopEntity(
            id: entity.id,
            name: entity.name,
            imageUrl: entity.imageUrl,
            rating: entity.rating,
            reviewsCount: entity.reviewsCount,
            distance: entity.distance,
            services: entity.services,
            mobile: entity.mobile,
            address: entity.address,
            lat: entity.lat,
            lng: entity.lng,
            products: products.map((e) => e.toEntity()).toList(),
            activeServices: services.map((e) => e.toEntity()).toList(),
            userReservations: reservations,
            productsError: productsError,
            servicesError: servicesError,
            reservationsError: reservationsError,
            email: entity.email,
            ostan: entity.ostan,
            shahrestan: entity.shahrestan,
            brand: entity.brand,
            phoneNumbers: entity.phoneNumbers,
            shopImages: entity.shopImages,
            status: entity.status,
            distanceKm: entity.distanceKm,
            profileImageId: entity.profileImageId,
          ));
        } else {
          return DataFailed(detailsData is Map ? (detailsData['message'] ?? "خطایی رخ داد") : "خطایی رخ داد");
        }
      } else {
        return DataFailed(detailsResponse is Response && detailsResponse.data is Map 
            ? (detailsResponse.data['message'] ?? "خطا در دریافت اطلاعات") 
            : "خطا در دریافت اطلاعات");
      }
    } catch (e) {
      print(e);
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<AppointmentsEntity>>> fetchUserReservationsForRepairman(String repairmanId) async {
    try {
      final response = await _apiProvider.getUserReservationsForRepairman(repairmanId: repairmanId);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          final data = body['data'];
          final items = (data is Map) ? data['data'] : data;
          if (items is List) {
            final reservations = items
                .whereType<Map<String, dynamic>>()
                .map((e) => ReservationModel.fromJson(e).toEntity())
                .toList();
            return DataSuccess(reservations);
          }
        }
      }
      return const DataFailed("خطا در دریافت رزروها");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<List<TimeSlotModel>>> fetchPublicTimeSlots(String repairmanId, {String? date}) async {
    try {
      final response = await _apiProvider.getPublicTimeSlots(repairmanId: repairmanId, date: date);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body is Map && (body['status'] == true || body['success'] == true)) {
          final data = body['data'];
          // Handle both paginated and non-paginated data structures
          final items = (data is Map) ? data['data'] : data;
          if (items is List) {
            final slots = items.map((e) => TimeSlotModel.fromJson(e)).toList();
            return DataSuccess(slots);
          }
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطا در دریافت زمان‌ها") : "خطا در دریافت زمان‌ها");
      }
      return DataFailed("خطا در برقراری ارتباط با سرور");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> reserveTimeSlot(String timeSlotId, String description) async {
    try {
      final response = await _apiProvider.reserveTimeSlot(timeSlotId: timeSlotId, description: description);
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        final body = response.data;
        if (body is Map && (body['status'] == true || body['success'] == true)) {
          return DataSuccess(Map<String, dynamic>.from(body['data']));
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطا در ثبت رزرو") : "خطا در ثبت رزرو");
      }
      if (response is Response && response.statusCode == 409) {
        return DataFailed(response.data is Map ? response.data['message'] : "بازه زمانی پر شده است");
      }
      return DataFailed(response is Response && response.data is Map ? response.data['message'] : "خطا در ثبت رزرو");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> storeRating(String repairmanId, int score, String description) async {
    try {
      final response = await _apiProvider.storeRating(
        repairmanId: repairmanId,
        score: score,
        description: description,
      );
      if (response is Response && (response.statusCode == 200 || response.statusCode == 201)) {
        final body = response.data;
        if (body is Map && body['success'] == true) {
          return DataSuccess(Map<String, dynamic>.from(body));
        }
        return DataFailed(body is Map ? (body['message'] ?? "خطا در ثبت امتیاز") : "خطا در ثبت امتیاز");
      }
      return DataFailed(response is Response && response.data is Map ? response.data['message'] : "خطا در ثبت امتیاز");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<List<RatingModel>>> fetchRepairmanRatings(String repairmanId, {int page = 1}) async {
    try {
      final response = await _apiProvider.getRepairmanRatings(
        repairmanId: repairmanId,
        page: page,
      );
      if (response is Response && response.statusCode == 200) {
        if (response.data['success'] == true) {
          final listModel = RatingListModel.fromJson(response.data['data']);
          return DataSuccess(listModel.data);
        }
      }
      return DataFailed(response is Response && response.data is Map ? response.data['message'] : "خطا در دریافت لیست امتیازها");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }
}
