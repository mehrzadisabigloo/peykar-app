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
    final currentState = state;
    if (currentState is BankAccountsLoaded) {
      emit(currentState.copyWith(isActionLoading: true, clearMessages: true));
    } else if (currentState is BanksLoaded) {
      emit(currentState.copyWith(isActionLoading: true));
    } else if (currentState is ManageBankAccountsError) {
      emit(currentState.copyWith(isActionLoading: true));
    }
    
    final dataState = await _repository.addBankAccount(event.account);
    final nextState = state;
    
    if (dataState is DataSuccess) {
      if (nextState is BankAccountsLoaded) {
        emit(nextState.copyWith(isActionLoading: false, successMessage: "حساب بانکی با موفقیت ثبت شد"));
      } else if (nextState is BanksLoaded) {
        emit(nextState.copyWith(isActionLoading: false));
        emit(const BankAccountActionSuccess("حساب بانکی با موفقیت ثبت شد"));
      } else {
        emit(const BankAccountActionSuccess("حساب بانکی با موفقیت ثبت شد"));
      }
    } else {
      if (nextState is BankAccountsLoaded) {
        emit(nextState.copyWith(isActionLoading: false, errorMessage: dataState.error ?? "خطا در ثبت حساب"));
      } else if (nextState is BanksLoaded) {
        emit(nextState.copyWith(isActionLoading: false));
        emit(ManageBankAccountsError(dataState.error ?? "خطا در ثبت حساب"));
      } else {
        emit(ManageBankAccountsError(dataState.error ?? "خطا در ثبت حساب"));
      }
    }
  }

  Future<void> _onUpdateBankAccount(UpdateBankAccountEvent event, Emitter<ManageBankAccountsState> emit) async {
    final currentState = state;
    if (currentState is BankAccountsLoaded) {
      emit(currentState.copyWith(isActionLoading: true, clearMessages: true));
    } else if (currentState is BanksLoaded) {
      emit(currentState.copyWith(isActionLoading: true));
    } else if (currentState is ManageBankAccountsError) {
      emit(currentState.copyWith(isActionLoading: true));
    }
    
    final dataState = await _repository.updateBankAccount(event.id, event.account);
    final nextState = state;
    
    if (dataState is DataSuccess) {
      if (nextState is BankAccountsLoaded) {
        emit(nextState.copyWith(isActionLoading: false, successMessage: "حساب بانکی با موفقیت بروزرسانی شد"));
      } else if (nextState is BanksLoaded) {
        emit(nextState.copyWith(isActionLoading: false));
        emit(const BankAccountActionSuccess("حساب بانکی با موفقیت بروزرسانی شد"));
      } else {
        emit(const BankAccountActionSuccess("حساب بانکی با موفقیت بروزرسانی شد"));
      }
    } else {
      if (nextState is BankAccountsLoaded) {
        emit(nextState.copyWith(isActionLoading: false, errorMessage: dataState.error ?? "خطا در بروزرسانی"));
      } else if (nextState is BanksLoaded) {
        emit(nextState.copyWith(isActionLoading: false));
        emit(ManageBankAccountsError(dataState.error ?? "خطا در بروزرسانی"));
      } else {
        emit(ManageBankAccountsError(dataState.error ?? "خطا در بروزرسانی"));
      }
    }
  }

  Future<void> _onDeleteBankAccount(DeleteBankAccountEvent event, Emitter<ManageBankAccountsState> emit) async {
    final currentState = state;
    if (currentState is! BankAccountsLoaded) return;
    
    emit(currentState.copyWith(processingId: event.id, isDeleting: true, clearMessages: true));
    
    final dataState = await _repository.deleteBankAccount(event.id);
    if (dataState is DataSuccess) {
      emit(currentState.copyWith(successMessage: "حساب بانکی با موفقیت حذف شد", clearProcessingId: true));
      add(const FetchBankAccounts());
    } else {
      emit(currentState.copyWith(errorMessage: dataState.error ?? "خطا در حذف", clearProcessingId: true));
    }
  }

  Future<void> _onChangeStatus(ChangeBankAccountStatusEvent event, Emitter<ManageBankAccountsState> emit) async {
    final currentState = state;
    if (currentState is! BankAccountsLoaded) return;

    emit(currentState.copyWith(processingId: event.id, isDeleting: false, clearMessages: true));
    
    final dataState = await _repository.changeBankAccountStatus(event.id);
    if (dataState is DataSuccess) {
      emit(currentState.copyWith(successMessage: "وضعیت با موفقیت تغییر یافت", clearProcessingId: true));
      add(const FetchBankAccounts());
    } else {
      emit(currentState.copyWith(errorMessage: dataState.error ?? "خطا در تغییر وضعیت", clearProcessingId: true));
    }
  }
}
