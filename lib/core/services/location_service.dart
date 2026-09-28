import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception('سرویس مکان‌یابی غیرفعال است.');
    }

    // Check permission
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception('دسترسی به موقعیت مکانی رد شد.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      throw Exception(
        'دسترسی به موقعیت مکانی برای همیشه رد شده است. لطفا از تنظیمات گوشی آن را فعال کنید.',
      );
    }

    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 20),
        ),
      );
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        throw Exception('زمان دریافت موقعیت مکانی به پایان رسید. لطفا مجدد تلاش کنید.');
      }
      throw Exception('خطا در دریافت موقعیت مکانی: $e');
    }
  }
}
