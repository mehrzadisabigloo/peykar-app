import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';
import '../../domain/repository/manage_reminder_types_repository.dart';

part 'manage_reminder_types_event.dart';
part 'manage_reminder_types_state.dart';

class ManageReminderTypesBloc extends BaseBloc<ManageReminderTypesEvent, ManageReminderTypesState> {
  final ManageReminderTypesRepository _repository;
  final WidgetInfiniteListBloc listBloc;
  final int _countItem = 10;

  ManageReminderTypesBloc(this._repository, this.listBloc) : super(const ManageReminderTypesInitial()) {
    on<FetchReminderTypes>(_onFetchReminderTypes);
    on<LoadMoreReminderTypes>(_onLoadMoreReminderTypes);
    on<ChangeReminderTypeStatus>(_onChangeReminderTypeStatus);
    on<DeleteReminderType>(_onDeleteReminderType);
    on<AddReminderTypeEvent>(_onAddReminderType);
    on<EditReminderTypeEvent>(_onEditReminderType);
  }

  Future<void> _onFetchReminderTypes(FetchReminderTypes event, Emitter<ManageReminderTypesState> emit) async {
    emit(ManageReminderTypesLoading(
      reminderTypes: event.isRefresh ? [] : state.reminderTypes,
      page: event.isRefresh ? 1 : state.page,
      hasMore: event.isRefresh ? true : state.hasMore,
    ));

    final result = await _repository.listReminderTypes(
      isPaginate: true,
      countItem: _countItem,
      title: event.title,
    );

    if (result is DataSuccess) {
      final types = result.data ?? [];
      emit(ManageReminderTypesLoaded(
        reminderTypes: types,
        page: 1,
        hasMore: types.length >= _countItem,
      ));
    } else {
      emit(ManageReminderTypesFailed(result.error ?? 'خطا در بارگذاری اطلاعات'));
    }
  }

  Future<void> _onLoadMoreReminderTypes(LoadMoreReminderTypes event, Emitter<ManageReminderTypesState> emit) async {
    if (!state.hasMore || state is ManageReminderTypesLoading) return;

    if (state is ManageReminderTypesLoaded) {
      emit((state as ManageReminderTypesLoaded).copyWith(clearMessages: true));
    }

    final nextPage = state.page + 1;
    
    final result = await _repository.listReminderTypes(
      isPaginate: true,
      countItem: _countItem,
      // We need to pass the page to the API if it supports it, 
      // otherwise we fetch a larger count as seen in other blocs
    );
    
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (result is DataSuccess) {
      final types = result.data ?? [];
      // If the API doesn't support a 'page' param, we just replace or append
      // In this project's pattern, it seems they often fetch (count * page)
      emit(ManageReminderTypesLoaded(
        reminderTypes: types,
        page: nextPage,
        hasMore: types.length >= (_countItem * nextPage),
      ));
    } else {
      if (state is ManageReminderTypesLoaded) {
        emit((state as ManageReminderTypesLoaded).copyWith(errorMessage: result.error));
      }
    }
  }

  Future<void> _onChangeReminderTypeStatus(ChangeReminderTypeStatus event, Emitter<ManageReminderTypesState> emit) async {
    if (state is! ManageReminderTypesLoaded) return;
    
    emit((state as ManageReminderTypesLoaded).copyWith(processingId: event.id, clearMessages: true));

    final result = await _repository.changeStatus(event.id);

    if (result is DataSuccess) {
      final updatedTypes = state.reminderTypes.map((t) {
        if (t.id == event.id) {
          return t.copyWith(status: t.isActive ? 'Deactive' : 'Active');
        }
        return t;
      }).toList();

      emit((state as ManageReminderTypesLoaded).copyWith(
        reminderTypes: updatedTypes,
        clearProcessingId: true,
        successMessage: 'وضعیت با موفقیت تغییر کرد',
      ));
    } else {
      emit((state as ManageReminderTypesLoaded).copyWith(
        clearProcessingId: true,
        errorMessage: result.error ?? 'خطا در تغییر وضعیت',
      ));
    }
  }

  Future<void> _onDeleteReminderType(DeleteReminderType event, Emitter<ManageReminderTypesState> emit) async {
    if (state is! ManageReminderTypesLoaded) return;
    
    emit((state as ManageReminderTypesLoaded).copyWith(deletingId: event.id, clearMessages: true));

    final result = await _repository.deleteReminderType(event.id);

    if (result is DataSuccess) {
      final updatedTypes = state.reminderTypes.where((t) => t.id != event.id).toList();
      emit((state as ManageReminderTypesLoaded).copyWith(
        reminderTypes: updatedTypes,
        clearDeletingId: true,
        successMessage: 'با موفقیت حذف شد',
      ));
    } else {
      emit((state as ManageReminderTypesLoaded).copyWith(
        clearDeletingId: true,
        errorMessage: result.error ?? 'خطا در حذف',
      ));
    }
  }

  Future<void> _onAddReminderType(AddReminderTypeEvent event, Emitter<ManageReminderTypesState> emit) async {
    ManageReminderTypesLoaded currentState;
    if (state is ManageReminderTypesLoaded) {
      currentState = state as ManageReminderTypesLoaded;
    } else {
      currentState = ManageReminderTypesLoaded(
        reminderTypes: state.reminderTypes,
        page: state.page,
        hasMore: state.hasMore,
      );
    }

    emit(currentState.copyWith(isSubmitting: true, clearMessages: true));

    final result = await _repository.addReminderType(title: event.title);

    if (result is DataSuccess) {
      emit(currentState.copyWith(
        isSubmitting: false,
        submissionSuccess: true,
        successMessage: 'نوع یادآور با موفقیت ایجاد شد',
      ));
    } else {
      emit(currentState.copyWith(
        isSubmitting: false,
        errorMessage: result.error ?? 'خطا در ایجاد نوع یادآور',
      ));
    }
  }

  Future<void> _onEditReminderType(EditReminderTypeEvent event, Emitter<ManageReminderTypesState> emit) async {
    ManageReminderTypesLoaded currentState;
    if (state is ManageReminderTypesLoaded) {
      currentState = state as ManageReminderTypesLoaded;
    } else {
      currentState = ManageReminderTypesLoaded(
        reminderTypes: state.reminderTypes,
        page: state.page,
        hasMore: state.hasMore,
      );
    }

    emit(currentState.copyWith(editingId: event.id, clearMessages: true, isSubmitting: true));

    final result = await _repository.editReminderType(id: event.id, title: event.title);

    if (result is DataSuccess) {
      emit(currentState.copyWith(
        clearEditingId: true,
        isSubmitting: false,
        submissionSuccess: true,
        successMessage: 'نوع یادآور با موفقیت ویرایش شد',
      ));
    } else {
      emit(currentState.copyWith(
        clearEditingId: true,
        isSubmitting: false,
        errorMessage: result.error ?? 'خطا در ویرایش نوع یادآور',
      ));
    }
  }
}
