
import '../../../domain/entity/appointments_entity.dart';

class AppointmentsApiProvider {
  Future<List<AppointmentsEntity>> getAppointments() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      AppointmentsEntity(
        id: '1',
        time: '۰۹:۰۰',
        serviceName: 'تعویض روغن موتور',
        subTitle: 'پژو ۲۰۶',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentsEntity(
        id: '2',
        time: '۱۰:۳۰',
        serviceName: 'تنظیم موتور',
        subTitle: 'سمند EF7',
        status: AppointmentStatus.pending,
      ),
      AppointmentsEntity(
        id: '3',
        time: '۱۲:۰۰',
        serviceName: 'تعویض تسمه تایم',
        subTitle: 'دنا پلاس',
        status: AppointmentStatus.confirmed,
      ),
      AppointmentsEntity(
        id: '4',
        time: '۱۴:۳۰',
        serviceName: 'بازدید و تعمیر',
        subTitle: 'پارس TU5',
        status: AppointmentStatus.canceled,
      ),
    ];
  }
}
