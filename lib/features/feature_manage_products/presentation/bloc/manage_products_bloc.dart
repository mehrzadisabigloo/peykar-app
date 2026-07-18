import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/manage_products_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_products_entity.dart';

part 'manage_products_event.dart';
part 'manage_products_state.dart';

class ManageProductsBloc extends BaseBloc<ManageProductsEvent, ManageProductsState> {
  final ManageProductsRepository manageProductsRepository;

  ManageProductsBloc(this.manageProductsRepository) : super(const ManageProductsInitial()) {
    on<FetchManageProductsDataEvent>(_onFetchManageProductsData);
  }

  Future<void> _onFetchManageProductsData(FetchManageProductsDataEvent event, Emitter<ManageProductsState> emit) async {
    emit(const ManageProductsLoading());
    
    final dataState = await manageProductsRepository.fetchManageProductsData();

    if (dataState is DataSuccess) {
      emit(ManageProductsLoaded(dataState.data ?? []));
    } else {
      emit(ManageProductsError(dataState.error ?? "خطا در دریافت لیست محصولات"));
    }
  }
}
