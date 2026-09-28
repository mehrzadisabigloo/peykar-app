import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';
import '../../domain/repository/manage_reminder_sub_items_repository.dart';

part 'manage_reminder_sub_items_event.dart';
part 'manage_reminder_sub_items_state.dart';

class ManageReminderSubItemsBloc extends BaseBloc<ManageReminderSubItemsEvent, ManageReminderSubItemsState> {
  final ManageReminderSubItemsRepository _repository;
  final WidgetInfiniteListBloc listBloc;
  final int _countItem = 10;

  ManageReminderSubItemsBloc(this._repository, this.listBloc) : super(const ManageReminderSubItemsInitial()) {
    on<FetchReminderSubItems>(_onFetchSubItems);
    on<LoadMoreReminderSubItems>(_onLoadMoreSubItems);
    on<ChangeSubItemStatus>(_onChangeStatus);
    on<DeleteSubItem>(_onDeleteSubItem);
    on<AddSubItemEvent>(_onAddSubItem);
    on<AddSubItemsBulkEvent>(_onAddSubItemsBulk);
    on<EditSubItemEvent>(_onEditSubItem);
  }

  Future<void> _onFetchSubItems(FetchReminderSubItems event, Emitter<ManageReminderSubItemsState> emit) async {
    emit(ManageReminderSubItemsLoading(
      subItems: event.isRefresh ? [] : state.subItems,
      page: event.isRefresh ? 1 : state.page,
      hasMore: event.isRefresh ? true : state.hasMore,
      reminderTypeId: event.reminderTypeId ?? state.reminderTypeId,
    ));

    final result = await _repository.listSubItems(
      reminderTypeId: event.reminderTypeId ?? state.reminderTypeId,
      title: event.title,
      isPaginate: true,
      countItem: _countItem,
    );

    if (result is DataSuccess) {
      final items = result.data ?? [];
      emit(ManageReminderSubItemsLoaded(
        subItems: items,
        page: 1,
        hasMore: items.length >= _countItem,
        reminderTypeId: event.reminderTypeId ?? state.reminderTypeId,
      ));
    } else {
      emit(ManageReminderSubItemsFailed(result.error ?? 'خطا در بارگذاری اطلاعات'));
    }
  }

  Future<void> _onLoadMoreSubItems(LoadMoreReminderSubItems event, Emitter<ManageReminderSubItemsState> emit) async {
    if (!state.hasMore || state is ManageReminderSubItemsLoading) return;

    if (state is ManageReminderSubItemsLoaded) {
      emit((state as ManageReminderSubItemsLoaded).copyWith(clearMessages: true));
    }

    final nextPage = state.page + 1;
    
    final result = await _repository.listSubItems(
      reminderTypeId: state.reminderTypeId,
      isPaginate: true,
      countItem: _countItem,
      page: nextPage,
    );
    
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (result is DataSuccess) {
      final items = result.data ?? [];
      final allItems = List<ManageReminderSubItemEntity>.from(state.subItems)..addAll(items);
      
      emit(ManageReminderSubItemsLoaded(
        subItems: allItems,
        page: nextPage,
        hasMore: items.length >= _countItem,
        reminderTypeId: state.reminderTypeId,
      ));
    } else {
      if (state is ManageReminderSubItemsLoaded) {
        emit((state as ManageReminderSubItemsLoaded).copyWith(errorMessage: result.error));
      }
    }
  }

  Future<void> _onChangeStatus(ChangeSubItemStatus event, Emitter<ManageReminderSubItemsState> emit) async {
    if (state is! ManageReminderSubItemsLoaded) return;
    
    emit((state as ManageReminderSubItemsLoaded).copyWith(processingId: event.id, clearMessages: true));

    final result = await _repository.changeStatus(event.id);

    if (result is DataSuccess) {
      final updatedItems = state.subItems.map((t) {
        if (t.id == event.id) {
          return t.copyWith(status: t.isActive ? 'Deactive' : 'Active');
        }
        return t;
      }).toList();

      emit((state as ManageReminderSubItemsLoaded).copyWith(
        subItems: updatedItems,
        clearProcessingId: true,
        successMessage: 'وضعیت با موفقیت تغییر کرد',
      ));
    } else {
      emit((state as ManageReminderSubItemsLoaded).copyWith(
        clearProcessingId: true,
        errorMessage: result.error ?? 'خطا در تغییر وضعیت',
      ));
    }
  }

  Future<void> _onDeleteSubItem(DeleteSubItem event, Emitter<ManageReminderSubItemsState> emit) async {
    if (state is! ManageReminderSubItemsLoaded) return;
    
    emit((state as ManageReminderSubItemsLoaded).copyWith(deletingId: event.id, clearMessages: true));

    final result = await _repository.deleteSubItem(event.id);

    if (result is DataSuccess) {
      final updatedItems = state.subItems.where((t) => t.id != event.id).toList();
      emit((state as ManageReminderSubItemsLoaded).copyWith(
        subItems: updatedItems,
        clearDeletingId: true,
        successMessage: 'با موفقیت حذف شد',
      ));
    } else {
      emit((state as ManageReminderSubItemsLoaded).copyWith(
        clearDeletingId: true,
        errorMessage: result.error ?? 'خطا در حذف',
      ));
    }
  }

  Future<void> _onAddSubItem(AddSubItemEvent event, Emitter<ManageReminderSubItemsState> emit) async {
    ManageReminderSubItemsLoaded currentState;
    if (state is ManageReminderSubItemsLoaded) {
      currentState = state as ManageReminderSubItemsLoaded;
    } else {
      currentState = ManageReminderSubItemsLoaded(
        subItems: state.subItems,
        page: state.page,
        hasMore: state.hasMore,
        reminderTypeId: event.reminderTypeId,
      );
    }

    emit(currentState.copyWith(isSubmitting: true, clearMessages: true));

    final result = await _repository.addSubItem(reminderTypeId: event.reminderTypeId, title: event.title);

    if (result is DataSuccess) {
      emit(currentState.copyWith(
        isSubmitting: false,
        submissionSuccess: true,
        successMessage: 'زیرمجموعه با موفقیت ایجاد شد',
      ));
    } else {
      emit(currentState.copyWith(
        isSubmitting: false,
        errorMessage: result.error ?? 'خطا در ایجاد زیرمجموعه',
      ));
    }
  }

  Future<void> _onAddSubItemsBulk(AddSubItemsBulkEvent event, Emitter<ManageReminderSubItemsState> emit) async {
    ManageReminderSubItemsLoaded currentState;
    if (state is ManageReminderSubItemsLoaded) {
      currentState = state as ManageReminderSubItemsLoaded;
    } else {
      currentState = ManageReminderSubItemsLoaded(
        subItems: state.subItems,
        page: state.page,
        hasMore: state.hasMore,
        reminderTypeId: event.reminderTypeId,
      );
    }

    emit(currentState.copyWith(isSubmitting: true, clearMessages: true));

    final result = await _repository.addSubItemsBulk(reminderTypeId: event.reminderTypeId, titles: event.titles);

    if (result is DataSuccess) {
      emit(currentState.copyWith(
        isSubmitting: false,
        submissionSuccess: true,
        successMessage: 'زیرمجموعه‌ها با موفقیت ایجاد شدند',
      ));
    } else {
      emit(currentState.copyWith(
        isSubmitting: false,
        errorMessage: result.error ?? 'خطا در ایجاد زیرمجموعه‌ها',
      ));
    }
  }

  Future<void> _onEditSubItem(EditSubItemEvent event, Emitter<ManageReminderSubItemsState> emit) async {
    ManageReminderSubItemsLoaded currentState;
    if (state is ManageReminderSubItemsLoaded) {
      currentState = state as ManageReminderSubItemsLoaded;
    } else {
      currentState = ManageReminderSubItemsLoaded(
        subItems: state.subItems,
        page: state.page,
        hasMore: state.hasMore,
      );
    }

    emit(currentState.copyWith(editingId: event.id, clearMessages: true, isSubmitting: true));

    final result = await _repository.editSubItem(id: event.id, title: event.title);

    if (result is DataSuccess) {
      emit(currentState.copyWith(
        clearEditingId: true,
        isSubmitting: false,
        submissionSuccess: true,
        successMessage: 'زیرمجموعه با موفقیت ویرایش شد',
      ));
    } else {
      emit(currentState.copyWith(
        clearEditingId: true,
        isSubmitting: false,
        errorMessage: result.error ?? 'خطا در ویرایش زیرمجموعه',
      ));
    }
  }
}
