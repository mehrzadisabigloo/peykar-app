part of 'manage_bank_accounts_bloc.dart';

abstract class ManageBankAccountsEvent extends Equatable {
  const ManageBankAccountsEvent();
  @override
  List<Object?> get props => [];
}

class FetchBankAccounts extends ManageBankAccountsEvent {
  final BankAccountFilterParams params;
  const FetchBankAccounts({this.params = const BankAccountFilterParams()});
  @override
  List<Object?> get props => [params];
}

class AddBankAccountEvent extends ManageBankAccountsEvent {
  final BankAccountEntity account;
  const AddBankAccountEvent(this.account);
  @override
  List<Object?> get props => [account];
}

class UpdateBankAccountEvent extends ManageBankAccountsEvent {
  final String id;
  final BankAccountEntity account;
  const UpdateBankAccountEvent(this.id, this.account);
  @override
  List<Object?> get props => [id, account];
}

class DeleteBankAccountEvent extends ManageBankAccountsEvent {
  final String id;
  const DeleteBankAccountEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class ChangeBankAccountStatusEvent extends ManageBankAccountsEvent {
  final String id;
  const ChangeBankAccountStatusEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class FetchBanksEvent extends ManageBankAccountsEvent {
  final BankFilterParams params;
  const FetchBanksEvent({this.params = const BankFilterParams()});
  @override
  List<Object?> get props => [params];
}
