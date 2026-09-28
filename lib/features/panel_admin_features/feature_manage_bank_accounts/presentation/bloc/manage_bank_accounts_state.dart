part of 'manage_bank_accounts_bloc.dart';

abstract class ManageBankAccountsState extends Equatable {
  const ManageBankAccountsState();
  @override
  List<Object?> get props => [];
}

class ManageBankAccountsInitial extends ManageBankAccountsState {}

class ManageBankAccountsLoading extends ManageBankAccountsState {}

class BankAccountsLoaded extends ManageBankAccountsState {
  final List<BankAccountEntity> accounts;
  final String? processingId;
  final bool isDeleting;
  final bool isActionLoading;
  final String? successMessage;
  final String? errorMessage;
  
  const BankAccountsLoaded(
    this.accounts, {
    this.processingId,
    this.isDeleting = false,
    this.isActionLoading = false,
    this.successMessage,
    this.errorMessage,
  });
  
  @override
  List<Object?> get props => [accounts, processingId, isDeleting, isActionLoading, successMessage, errorMessage];

  BankAccountsLoaded copyWith({
    List<BankAccountEntity>? accounts,
    String? processingId,
    bool? isDeleting,
    bool? isActionLoading,
    String? successMessage,
    String? errorMessage,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return BankAccountsLoaded(
      accounts ?? this.accounts,
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      isDeleting: isDeleting ?? this.isDeleting,
      isActionLoading: isActionLoading ?? this.isActionLoading,
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
    );
  }
}

class ManageBankAccountsError extends ManageBankAccountsState {
  final String message;
  final bool isActionLoading;
  const ManageBankAccountsError(this.message, {this.isActionLoading = false});
  @override
  List<Object?> get props => [message, isActionLoading];

  ManageBankAccountsError copyWith({
    String? message,
    bool? isActionLoading,
  }) {
    return ManageBankAccountsError(
      message ?? this.message,
      isActionLoading: isActionLoading ?? this.isActionLoading,
    );
  }
}

class BankAccountActionSuccess extends ManageBankAccountsState {
  final String message;
  const BankAccountActionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class BanksLoaded extends ManageBankAccountsState {
  final List<BankEntity> banks;
  final bool isActionLoading;
  const BanksLoaded(this.banks, {this.isActionLoading = false});
  @override
  List<Object?> get props => [banks, isActionLoading];

  BanksLoaded copyWith({
    List<BankEntity>? banks,
    bool? isActionLoading,
  }) {
    return BanksLoaded(
      banks ?? this.banks,
      isActionLoading: isActionLoading ?? this.isActionLoading,
    );
  }
}
