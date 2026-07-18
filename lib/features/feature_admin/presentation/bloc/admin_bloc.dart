import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/admin_repository.dart';
import '../../../../core/resources/data_state.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends BaseBloc<AdminEvent, AdminState> {
  final AdminRepository adminRepository;

  AdminBloc(this.adminRepository) : super(const AdminInitial()) {
    on<FetchAdminDataEvent>(_onFetchAdminData);
  }

  Future<void> _onFetchAdminData(FetchAdminDataEvent event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    final dataState = await adminRepository.fetchAdminData();

    if (dataState is DataSuccess) {
      emit(const AdminLoaded());
    } else {
      emit(AdminError(dataState.error ?? "خطا در دریافت اطلاعات مدیریت"));
    }
  }
}
