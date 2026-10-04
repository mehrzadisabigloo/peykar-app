import 'package:flutter/material.dart';
import 'package:chaharmahal_shop_front/features/feature_reminders/data/model/reminder_response_model.dart';
import 'package:chaharmahal_shop_front/core/utils/jalali_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReminderModel Progress Calculation', () {
    test('Kilometer reminder progress calculation', () {
      final json = {
        'id': '1',
        'title': 'Oil Change',
        'time_reminder': false,
        'current_km': 185000,
        'kilometer_logs': [
          {'done_km': 180000, 'next_km': 190000}
        ],
        'color': 'blue'
      };

      final model = ReminderModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity.progress, 0.5);
      expect(entity.remainingText, '5000 کیلومتر مانده');
      expect(entity.progressColor, Colors.orange); // Default orange for kilometer reminder
    });

    test('Kilometer reminder critical progress calculation', () {
      final json = {
        'id': '2',
        'title': 'Brake Pad',
        'time_reminder': false,
        'current_km': 189500,
        'kilometer_logs': [
          {'done_km': 180000, 'next_km': 190000}
        ]
      };

      final model = ReminderModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity.progress, 0.95);
      expect(entity.remainingText, '500 کیلومتر مانده');
      expect(entity.progressColor, Colors.red);
    });

    test('Time reminder progress calculation', () {
      final now = DateTime.now();
      final done = now.subtract(const Duration(days: 30));
      final next = now.add(const Duration(days: 30));

      String formatDate(DateTime dt) {
        final j = Jalali.fromDateTime(dt);
        return '${j.year}/${j.month}/${j.day}';
      }

      final json = {
        'id': '3',
        'title': 'Insurance',
        'time_reminder': true,
        'time_logs': [
          {'done_date': formatDate(done), 'next_date': formatDate(next)}
        ]
      };

      final model = ReminderModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity.progress, closeTo(0.5, 0.05));
      expect(entity.remainingText, anyOf(contains('30 روز مانده'), contains('29 روز مانده')));
    });
  });
}
