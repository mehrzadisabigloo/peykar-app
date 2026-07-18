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
  const BankAccountsLoaded(this.accounts);
  @override
  List<Object?> get props => [accounts];
}

class ManageBankAccountsError extends ManageBankAccountsState {
  final String message;
  const ManageBankAccountsError(this.message);
  @override
  List<Object?> get props => [message];
}

class BankAccountActionSuccess extends ManageBankAccountsState {
  final String message;
  const BankAccountActionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class BanksLoaded extends ManageBankAccountsState {
  final List<BankEntity> banks;
  const BanksLoaded(this.banks);
  @override
  List<Object?> get props => [banks];
}
