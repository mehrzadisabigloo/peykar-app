import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_bank_accounts_entity.dart';
import '../../domain/repository/manage_bank_accounts_repository.dart';

part 'manage_bank_accounts_event.dart';
part 'manage_bank_accounts_state.dart';

class ManageBankAccountsBloc extends BaseBloc<ManageBankAccountsEvent, ManageBankAccountsState> {
  final ManageBankAccountsRepository _repository;

  ManageBankAccountsBloc(this._repository) : super(ManageBankAccountsInitial()) {
    on<FetchBankAccounts>(_onFetchBankAccounts);
    on<AddBankAccountEvent>(_onAddBankAccount);
    on<UpdateBankAccountEvent>(_onUpdateBankAccount);
    on<DeleteBankAccountEvent>(_onDeleteBankAccount);
    on<ChangeBankAccountStatusEvent>(_onChangeStatus);
    on<FetchBanksEvent>(_onFetchBanks);
  }

  Future<void> _onFetchBankAccounts(FetchBankAccounts event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.fetchBankAccounts(event.params);
    if (dataState is DataSuccess) {
      emit(BankAccountsLoaded(dataState.data!));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onFetchBanks(FetchBanksEvent event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.fetchBanks(params: event.params);
    if (dataState is DataSuccess) {
      emit(BanksLoaded(dataState.data!));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در دریافت لیست بانک‌ها"));
    }
  }

  Future<void> _onAddBankAccount(AddBankAccountEvent event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.addBankAccount(event.account);
    if (dataState is DataSuccess) {
      emit(const BankAccountActionSuccess("حساب بانکی با موفقیت ثبت شد"));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در ثبت حساب"));
    }
  }

  Future<void> _onUpdateBankAccount(UpdateBankAccountEvent event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.updateBankAccount(event.id, event.account);
    if (dataState is DataSuccess) {
      emit(const BankAccountActionSuccess("حساب بانکی با موفقیت بروزرسانی شد"));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در بروزرسانی"));
    }
  }

  Future<void> _onDeleteBankAccount(DeleteBankAccountEvent event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.deleteBankAccount(event.id);
    if (dataState is DataSuccess) {
      emit(const BankAccountActionSuccess("حساب بانکی با موفقیت حذف شد"));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در حذف"));
    }
  }

  Future<void> _onChangeStatus(ChangeBankAccountStatusEvent event, Emitter<ManageBankAccountsState> emit) async {
    emit(ManageBankAccountsLoading());
    final dataState = await _repository.changeBankAccountStatus(event.id);
    if (dataState is DataSuccess) {
      emit(const BankAccountActionSuccess("وضعیت با موفقیت تغییر یافت"));
    } else {
      emit(ManageBankAccountsError(dataState.error ?? "خطا در تغییر وضعیت"));
    }
  }
}
