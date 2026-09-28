import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../domain/entity/appointments_entity.dart';
import '../../domain/repository/appointments_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/appointments_list_entity.dart';
import '../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends BaseBloc<AppointmentsEvent, AppointmentsState> {
  final AppointmentsRepository appointmentsRepository;
  final WidgetInfiniteListBloc listBloc;
  DateTime _currentDateTime = DateTime.now();
  String? _currentRole;
  String? _currentRepairmanId;

  AppointmentsBloc(this.appointmentsRepository, this.listBloc) : super(const AppointmentsInitial()) {
    on<FetchAppointmentsEvent>(_onFetchAppointments);
    on<LoadMoreAppointmentsEvent>(_onLoadMoreAppointments);
    on<ChangeDateEvent>(_onChangeDate);
    on<SelectDateEvent>(_onSelectDate);
    on<ToggleDatePickerEvent>(_onToggleDatePicker);
    on<AcceptAppointmentEvent>(_onAcceptAppointment);
    on<DeclineAppointmentEvent>(_onDeclineAppointment);
    on<CompleteAppointmentEvent>(_onCompleteAppointment);
    on<SubmitRatingEvent>(_onSubmitRating);
    on<ClearErrorToastEvent>(_onClearErrorToast);
  }

  int _currentPage = 1;
  List<AppointmentsEntity> _appointments = [];

  Future<void> _onSubmitRating(SubmitRatingEvent event, Emitter<AppointmentsState> emit) async {
    emit(const RatingSubmitting());
    final dataState = await appointmentsRepository.submitRating(
      repairmanId: event.repairmanId,
      score: event.score,
      description: event.description,
    );

    if (dataState is DataSuccess) {
      emit(RatingSuccess(dataState.data ?? "امتیاز شما با موفقیت ثبت شد"));
    } else {
      emit(RatingError(dataState.error ?? "خطا در ثبت امتیاز"));
    }
  }

  void _onClearErrorToast(ClearErrorToastEvent event, Emitter<AppointmentsState> emit) {
    if (state is AppointmentsLoaded) {
      emit((state as AppointmentsLoaded).copyWith(clearErrorToast: true));
    }
  }

  void _onToggleDatePicker(ToggleDatePickerEvent event, Emitter<AppointmentsState> emit) {
    if (state is AppointmentsLoaded) {
      final currentState = state as AppointmentsLoaded;
      emit(currentState.copyWith(showDatePicker: !currentState.showDatePicker));
    }
  }

  Future<void> _onSelectDate(SelectDateEvent event, Emitter<AppointmentsState> emit) async {
    _currentDateTime = event.date;
    if (state is AppointmentsLoaded) {
      final currentState = state as AppointmentsLoaded;
      emit(currentState.copyWith(
        currentDate: _formatJalali(_currentDateTime),
        selectedDateTime: _currentDateTime,
        showDatePicker: false,
      ));
    }
    await _onFetchAppointments(FetchAppointmentsEvent(role: _currentRole), emit);
  }

  Future<void> _onAcceptAppointment(AcceptAppointmentEvent event, Emitter<AppointmentsState> emit) async {
    if (state is AppointmentsLoaded) {
      emit((state as AppointmentsLoaded).copyWith(
        processingAppointmentId: event.appointmentId,
        processingAction: 'accept',
      ));
    }
    final dataState = await appointmentsRepository.confirmAppointment(event.appointmentId);
    if (dataState is DataSuccess) {
      await _onFetchAppointments(FetchAppointmentsEvent(role: _currentRole), emit);
    } else {
      if (state is AppointmentsLoaded) {
        emit((state as AppointmentsLoaded).copyWith(
          clearProcessingId: true,
          errorToastMessage: dataState.error ?? "خطا در تایید نوبت",
        ));
      }
    }
  }

  Future<void> _onDeclineAppointment(DeclineAppointmentEvent event, Emitter<AppointmentsState> emit) async {
    if (state is AppointmentsLoaded) {
      emit((state as AppointmentsLoaded).copyWith(
        processingAppointmentId: event.appointmentId,
        processingAction: 'decline',
      ));
    }
    final dataState = await appointmentsRepository.cancelAppointment(event.appointmentId, "لغو توسط تعمیرکار");
    if (dataState is DataSuccess) {
      await _onFetchAppointments(FetchAppointmentsEvent(role: _currentRole), emit);
    } else {
      if (state is AppointmentsLoaded) {
        emit((state as AppointmentsLoaded).copyWith(
          clearProcessingId: true,
          errorToastMessage: dataState.error ?? "خطا در لغو نوبت",
        ));
      }
    }
  }

  Future<void> _onCompleteAppointment(CompleteAppointmentEvent event, Emitter<AppointmentsState> emit) async {
    if (state is AppointmentsLoaded) {
      emit((state as AppointmentsLoaded).copyWith(
        processingAppointmentId: event.appointmentId,
        processingAction: 'complete',
      ));
    }
    final dataState = await appointmentsRepository.completeAppointment(event.appointmentId);
    if (dataState is DataSuccess) {
      await _onFetchAppointments(FetchAppointmentsEvent(role: _currentRole), emit);
    } else {
      if (state is AppointmentsLoaded) {
        emit((state as AppointmentsLoaded).copyWith(
          clearProcessingId: true,
          errorToastMessage: dataState.error ?? "خطا در تکمیل نوبت",
        ));
      }
    }
  }

  String _formatJalali(DateTime date) {
    final jalali = Jalali.fromDateTime(date);
    final weekDay = _getPersianWeekDay(date.weekday);
    return '$weekDay ${jalali.day} ${Jalali.monthNames[jalali.month - 1]} ${jalali.year}';
  }

  String _getPersianWeekDay(int day) {
    switch (day) {
      case 6: return 'شنبه';
      case 7: return 'یکشنبه';
      case 1: return 'دوشنبه';
      case 2: return 'سه‌شنبه';
      case 3: return 'چهارشنبه';
      case 4: return 'پنج‌شنبه';
      case 5: return 'جمعه';
      default: return '';
    }
  }

  String _formatJalaliForApi(DateTime date) {
    final jalali = Jalali.fromDateTime(date);
    return "${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}";
  }

  Future<void> _onFetchAppointments(FetchAppointmentsEvent event, Emitter<AppointmentsState> emit) async {
    emit(const AppointmentsLoading());
    _currentPage = 1;
    _appointments = [];

    if (event.role != null) {
      _currentRole = event.role;
    }
    
    if (event.repairmanId != null) {
      _currentRepairmanId = event.repairmanId;
    }

    if (event.initialDate != null) {
      _currentDateTime = event.initialDate!;
    }
    
    // Format date as Persian YYYY/MM/DD for the API
    final dateString = _formatJalaliForApi(_currentDateTime);

    final isUser = _currentRole == 'user' || _currentRole == 'customer';
    
    final dataState = isUser 
      ? await appointmentsRepository.fetchUserAppointments(
          date: dateString,
          page: _currentPage,
          repairmanId: _currentRepairmanId,
        )
      : await appointmentsRepository.fetchRepairmanAppointments(
          date: dateString,
          page: _currentPage,
        );

    if (dataState is DataSuccess) {
      final listEntity = dataState.data as AppointmentsListEntity;
      _appointments = listEntity.appointments;
      emit(AppointmentsLoaded(
        appointments: _appointments,
        currentDate: _formatJalali(_currentDateTime),
        selectedDateTime: _currentDateTime,
        showDatePicker: false,
        hasMore: listEntity.hasMore,
        currentPage: listEntity.currentPage,
      ));
    } else {
      emit(AppointmentsError(dataState.error ?? "خطا در دریافت نوبت‌ها"));
    }
  }

  Future<void> _onLoadMoreAppointments(LoadMoreAppointmentsEvent event, Emitter<AppointmentsState> emit) async {
    final currentState = state;
    if (currentState is! AppointmentsLoaded || !currentState.hasMore) return;

    emit(AppointmentsLoadingMore(
      appointments: _appointments,
      currentDate: currentState.currentDate,
      hasMore: currentState.hasMore,
      currentPage: currentState.currentPage,
    ));

    _currentPage++;
    final dateString = _formatJalaliForApi(_currentDateTime);

    if (event.role != null) {
      _currentRole = event.role;
    }
    
    if (event.repairmanId != null) {
      _currentRepairmanId = event.repairmanId;
    }
    
    final isUser = _currentRole == 'user' || _currentRole == 'customer';

    final dataState = isUser 
      ? await appointmentsRepository.fetchUserAppointments(
          date: dateString,
          page: _currentPage,
          repairmanId: _currentRepairmanId,
        )
      : await appointmentsRepository.fetchRepairmanAppointments(
          date: dateString,
          page: _currentPage,
        );

    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (dataState is DataSuccess) {
      final listEntity = dataState.data as AppointmentsListEntity;
      _appointments = [..._appointments, ...listEntity.appointments];
      emit(AppointmentsLoaded(
        appointments: _appointments,
        currentDate: _formatJalali(_currentDateTime),
        selectedDateTime: _currentDateTime,
        hasMore: listEntity.hasMore,
        currentPage: listEntity.currentPage,
      ));
    } else {
      _currentPage--;
      emit(AppointmentsLoaded(
        appointments: _appointments,
        currentDate: _formatJalali(_currentDateTime),
        selectedDateTime: _currentDateTime,
        hasMore: currentState.hasMore,
        currentPage: currentState.currentPage,
        errorToastMessage: dataState.error,
      ));
    }
  }

  void _onChangeDate(ChangeDateEvent event, Emitter<AppointmentsState> emit) {
    if (state is AppointmentsLoaded) {
      _currentDateTime = event.next 
          ? _currentDateTime.add(const Duration(days: 1)) 
          : _currentDateTime.subtract(const Duration(days: 1));
          
      emit((state as AppointmentsLoaded).copyWith(
        currentDate: _formatJalali(_currentDateTime),
        selectedDateTime: _currentDateTime,
      ));
      
      add(FetchAppointmentsEvent(role: event.role));
    }
  }
}
