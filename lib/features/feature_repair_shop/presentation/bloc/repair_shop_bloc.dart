import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/repair_shop_entity.dart';
import '../../domain/repository/repair_shop_repository.dart';
import '../../../../core/resources/data_state.dart';

part 'repair_shop_event.dart';
part 'repair_shop_state.dart';

class RepairShopBloc extends BaseBloc<RepairShopEvent, RepairShopState> {
  final RepairShopRepository repairShopRepository;

  RepairShopBloc(this.repairShopRepository) : super(const RepairShopInitial()) {
    on<FetchRepairShopDataEvent>(_onFetchRepairShopData);
  }

  Future<void> _onFetchRepairShopData(FetchRepairShopDataEvent event, Emitter<RepairShopState> emit) async {
    emit(const RepairShopLoading());
    final dataState = await repairShopRepository.fetchRepairShopData(event.repairmanId);

    if (dataState is DataSuccess) {
      emit(RepairShopLoaded(dataState.data!));
    } else {
      emit(RepairShopError(dataState.error ?? "خطا در دریافت اطلاعات تعمیرگاه"));
    }
  }
}
