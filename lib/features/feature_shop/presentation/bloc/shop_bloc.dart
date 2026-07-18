import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/shop_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/shop_entity.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends BaseBloc<ShopEvent, ShopState> {
  final ShopRepository shopRepository;

  ShopBloc(this.shopRepository) : super(const ShopInitial()) {
    on<FetchShopDataEvent>(_onFetchShopData);
  }

  Future<void> _onFetchShopData(FetchShopDataEvent event, Emitter<ShopState> emit) async {
    emit(const ShopLoading());
    final dataState = await shopRepository.fetchShopData();

    if (dataState is DataSuccess) {
      emit(ShopLoaded(dataState.data!));
    } else {
      emit(ShopError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }
}
