# Task Management

- [x] Redesign UI of `ScreenCreateTimeSlot` time and capacity inputs
- [/] Implement pagination for "My Reservations" in user mode
    - [ ] Update `AppointmentsApiProvider` with `getUserReservations`
    - [ ] Create `AppointmentsListEntity` and `AppointmentsListModel`
    - [ ] Update `AppointmentsRepository` and `AppointmentsRepositoryImpl`
    - [ ] Update `AppointmentsBloc` to handle user-mode pagination
    - [ ] Update `ScreenAppointments` to use `infinite_scroll_pagination` for user mode
    - [ ] Verify functionality
