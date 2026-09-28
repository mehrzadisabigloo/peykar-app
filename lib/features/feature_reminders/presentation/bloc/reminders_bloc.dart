import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/entity/reminders_entity.dart' hide KilometerLog, TimeLog;
import '../../domain/repository/reminders_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/model/reminder_request_models.dart' as req;
import 'package:equatable/equatable.dart';
import '../../../feature_manage_services/domain/repository/manage_services_repository.dart';
import '../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../domain/entity/reminders_list_entity.dart';
import '../../domain/entity/reminder_type_entity.dart';

part 'reminders_event.dart';
part 'reminders_state.dart';

class RemindersBloc extends BaseBloc<RemindersEvent, RemindersState> {
  final RemindersRepository remindersRepository;
  final ManageServicesRepository manageServicesRepository;
  final WidgetInfiniteListBloc listBloc;

  RemindersBloc(this.remindersRepository, this.manageServicesRepository, this.listBloc) : super(const RemindersInitial()) {
    on<FetchRemindersEvent>(_onFetchReminders);
    on<LoadMoreRemindersEvent>(_onLoadMoreReminders);
    on<FilterRemindersEvent>(_onFilterReminders);
    on<AddReminderEvent>(_onAddReminder);
    on<CompleteReminderEvent>(_onCompleteReminder);
    on<DeleteReminderEvent>(_onDeleteReminder);
    on<GetReminderEvent>(_onGetReminder);
    on<EditReminderEvent>(_onEditReminder);
    on<AddKilometerLogEvent>(_onAddKilometerLog);
    on<AddTimeLogEvent>(_onAddTimeLog);
    on<FetchServicesForReminderEvent>(_onFetchServicesForReminder);
    on<FetchActiveReminderTypesEvent>(_onFetchActiveReminderTypes);
    on<FetchSubItemsByReminderTypeEvent>(_onFetchSubItemsByReminderType);
    on<ClearReminderErrorToastEvent>(_onClearErrorToast);
  }

  req.ListUserRemindersRequest _currentRequest = req.ListUserRemindersRequest(isPaginate: true, countItem: 10, page: 1);
  List<RemindersEntity> _allReminders = [];
  ReminderType? _currentFilterType;

  void _onClearErrorToast(ClearReminderErrorToastEvent event, Emitter<RemindersState> emit) {
    if (state is RemindersLoaded) {
      emit((state as RemindersLoaded).copyWith(clearErrorToast: true));
    }
  }

  Future<void> _onFetchActiveReminderTypes(FetchActiveReminderTypesEvent event, Emitter<RemindersState> emit) async {
    final dataState = await remindersRepository.fetchActiveReminderTypes();
    if (dataState is DataSuccess) {
      emit(ActiveReminderTypesLoaded(dataState.data ?? []));
    } else {
      emit(ActiveReminderTypesError(dataState.error ?? "خطا در دریافت انواع یادآور"));
    }
  }

  Future<void> _onFetchSubItemsByReminderType(FetchSubItemsByReminderTypeEvent event, Emitter<RemindersState> emit) async {
    final dataState = await remindersRepository.fetchActiveReminderTypes();
    if (dataState is DataSuccess) {
      final types = dataState.data ?? [];
      final selectedType = types.firstWhere(
        (t) => t.id == event.reminderTypeId,
        orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
      );
      emit(SubItemsByReminderTypeLoaded(selectedType.subItems));
    } else {
      emit(SubItemsByReminderTypeError(dataState.error ?? "خطا در دریافت زیرمجموعه‌ها"));
    }
  }

  Future<void> _onFetchServicesForReminder(FetchServicesForReminderEvent event, Emitter<RemindersState> emit) async {
    final dataState = await manageServicesRepository.fetchActiveServices(isPaginate: false);
    if (dataState is DataSuccess) {
      emit(ServicesForReminderLoaded(dataState.data ?? []));
    } else {
      emit(ServicesForReminderError(dataState.error ?? "خطا در دریافت خدمات"));
    }
  }

  Future<void> _onFetchReminders(FetchRemindersEvent event, Emitter<RemindersState> emit) async {
    emit(const RemindersLoading());
    _currentRequest = event.request ?? req.ListUserRemindersRequest(isPaginate: true, countItem: 10, page: 1);
    _allReminders = [];

    final dataState = await remindersRepository.fetchReminders(_currentRequest);

    if (dataState is DataSuccess) {
      final listEntity = dataState.data as RemindersListEntity;
      _allReminders = listEntity.reminders;
      
      List<RemindersEntity> filtered = _applyFilter(_allReminders);

      emit(RemindersLoaded(
        allReminders: _allReminders,
        filteredReminders: filtered,
        currentType: _currentFilterType,
        hasMore: listEntity.hasMore,
        total: listEntity.total,
      ));
    } else {
      emit(RemindersError(dataState.error ?? "خطا در دریافت یادآورها"));
    }
  }

  Future<void> _onLoadMoreReminders(LoadMoreRemindersEvent event, Emitter<RemindersState> emit) async {
    final currentState = state;
    if (currentState is! RemindersLoaded || !currentState.hasMore) return;

    emit(RemindersLoadingMore(
      allReminders: _allReminders,
      filteredReminders: _applyFilter(_allReminders),
      hasMore: currentState.hasMore,
      total: currentState.total,
      currentType: _currentFilterType,
    ));

    _currentRequest = _currentRequest.copyWith(page: (_currentRequest.page ?? 1) + 1);
    final dataState = await remindersRepository.fetchReminders(_currentRequest);
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (dataState is DataSuccess) {
      final listEntity = dataState.data as RemindersListEntity;
      _allReminders = [..._allReminders, ...listEntity.reminders];
      
      emit(RemindersLoaded(
        allReminders: _allReminders,
        filteredReminders: _applyFilter(_allReminders),
        currentType: _currentFilterType,
        hasMore: listEntity.hasMore,
        total: listEntity.total,
      ));
    } else {
      _currentRequest = _currentRequest.copyWith(page: (_currentRequest.page ?? 1) - 1);
      emit(currentState.copyWith(
        errorToastMessage: dataState.error ?? "خطا در بارگذاری موارد بیشتر",
      ));
    }
  }

  void _onFilterReminders(FilterRemindersEvent event, Emitter<RemindersState> emit) {
    _currentFilterType = event.type;
    if (state is RemindersLoaded) {
      final currentState = state as RemindersLoaded;
      emit(currentState.copyWith(
        filteredReminders: _applyFilter(_allReminders),
        currentType: _currentFilterType,
        overrideType: true,
      ));
    }
  }

  List<RemindersEntity> _applyFilter(List<RemindersEntity> list) {
    if (_currentFilterType == null) return list;
    return list.where((r) => r.type == _currentFilterType).toList();
  }

  Future<void> _onAddReminder(AddReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const AddReminderLoading());
    final dataState = await remindersRepository.addReminder(event.request);

    if (dataState is DataSuccess) {
      emit(AddReminderSuccess(dataState.data));
    } else {
      emit(AddReminderError(dataState.error ?? "خطا در ثبت یادآور"));
    }
  }

  Future<void> _onCompleteReminder(CompleteReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const CompleteReminderLoading());
    final dataState = await remindersRepository.completeReminder(event.id);

    if (dataState is DataSuccess) {
      emit(CompleteReminderSuccess(dataState.data));
    } else {
      emit(CompleteReminderError(dataState.error ?? "خطا در بروزرسانی یادآور"));
    }
  }

  Future<void> _onDeleteReminder(DeleteReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const DeleteReminderLoading());
    final dataState = await remindersRepository.deleteReminder(event.id);

    if (dataState is DataSuccess) {
      emit(DeleteReminderSuccess(dataState.data));
    } else {
      emit(DeleteReminderError(dataState.error ?? "خطا در حذف یادآور"));
    }
  }

  Future<void> _onGetReminder(GetReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const GetReminderLoading());
    final dataState = await remindersRepository.getReminder(event.id);

    if (dataState is DataSuccess) {
      emit(GetReminderSuccess(dataState.data!));
    } else {
      emit(GetReminderError(dataState.error ?? "خطا در دریافت اطلاعات یادآور"));
    }
  }

  Future<void> _onEditReminder(EditReminderEvent event, Emitter<RemindersState> emit) async {
    emit(const EditReminderLoading());
    final dataState = await remindersRepository.editReminder(event.id, event.request);

    if (dataState is DataSuccess) {
      emit(EditReminderSuccess(dataState.data));
    } else {
      emit(EditReminderError(dataState.error ?? "خطا در ویرایش یادآور"));
    }
  }

  Future<void> _onAddKilometerLog(AddKilometerLogEvent event, Emitter<RemindersState> emit) async {
    emit(const AddLogLoading());
    final dataState = await remindersRepository.addKilometerLog(event.id, event.log);

    if (dataState is DataSuccess) {
      emit(const AddLogSuccess(null));
    } else {
      emit(AddLogError(dataState.error ?? "خطا در افزودن لاگ کیلومتر"));
    }
  }

  Future<void> _onAddTimeLog(AddTimeLogEvent event, Emitter<RemindersState> emit) async {
    emit(const AddLogLoading());
    final dataState = await remindersRepository.addTimeLog(event.id, event.log);

    if (dataState is DataSuccess) {
      emit(const AddLogSuccess(null));
    } else {
      emit(AddLogError(dataState.error ?? "خطا در افزودن لاگ زمان"));
    }
  }
}
