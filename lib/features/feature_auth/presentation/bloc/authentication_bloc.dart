// ignore_for_file: unused_import

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/entity/auth_entity.dart';
import '../../../panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends BaseBloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  final OccupationRepository occupationRepository;

  AuthenticationBloc(this.authRepository, this.occupationRepository) : super(const AuthenticationInitial()) {
    on<FetchAuthentication>(_onFetchAuthentication);
    on<LoginWithPassword>(_onLoginWithPassword);
    on<LoginWithSms>(_onLoginWithSms);
    on<ResendCode>(_onResendCode);
    on<SetPasswordEvent>(_onSetPassword);
    on<ForgetPasswordEvent>(_onForgetPassword);
    on<ChangePasswordEvent>(_onChangePassword);
    on<RegisterUserEvent>(_onRegisterUser);
    on<RegisterRepairmanEvent>(_onRegisterRepairman);
    on<FetchOccupations>(_onFetchOccupations);
  }

  Future<void> _onFetchAuthentication(FetchAuthentication event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.fetchAuth(event.mobile, event.loginBySms);
    if (dataState is DataSuccess) {
      emit(Loaded(dataState.data!));
      emit(const AuthenticationInitial());
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onLoginWithPassword(LoginWithPassword event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.loginWithPassword(event.mobile, event.password);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onLoginWithSms(LoginWithSms event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.loginWithSms(event.mobile, event.confirmCode);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onResendCode(ResendCode event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.resendConfirmCode(event.mobile);
    if (dataState is DataSuccess) {
      emit(Loaded(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onSetPassword(SetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.setPassword(event.password, event.passwordConfirmation);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onForgetPassword(ForgetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.forgetPassword(event.mobile, event.code, event.password);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onChangePassword(ChangePasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.changePassword(
      event.currentPassword,
      event.newPassword,
      event.newPasswordConfirmation,
    );
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onRegisterUser(RegisterUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.registerUser(event.userData);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onRegisterRepairman(RegisterRepairmanEvent event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final dataState = await authRepository.registerRepairman(event.repairmanData);
    if (dataState is DataSuccess) {
      emit(AuthSuccess(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطایی رخ داد"));
    }
  }

  Future<void> _onFetchOccupations(FetchOccupations event, Emitter<AuthenticationState> emit) async {
    emit(const OccupationLoading());
    final dataState = await occupationRepository.fetchActiveOccupations(const OccupationFilterParams(isPaginate: false));
    if (dataState is DataSuccess) {
      emit(OccupationsLoaded(dataState.data!));
    } else {
      emit(Failed(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }
}

