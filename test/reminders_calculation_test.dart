import 'package:flutter/material.dart';
import 'package:resturant_app/features/feature_reminders/data/model/reminder_response_model.dart';
import 'package:resturant_app/features/feature_reminders/domain/entity/reminders_entity.dart';
import 'package:resturant_app/core/utils/jalali_date.dart';
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

      expect(model.progress, 0.5);
      expect(model.remainingText, '5000 کیلومتر مانده');
      expect(model.progressColor, const Color(0xFF3F51B5)); // Default blue for < 0.7
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

      expect(model.progress, 0.95);
      expect(model.remainingText, '500 کیلومتر مانده');
      expect(model.progressColor, Colors.red);
    });

    test('Time reminder progress calculation', () {
      // Mocking today's date is hard without a wrapper, 
      // but we can use Jalali to generate strings relative to now.
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

      // Should be around 0.5
      expect(model.progress, closeTo(0.5, 0.05));
      expect(model.remainingText, anyOf(contains('30 روز مانده'), contains('29 روز مانده')));
    });
  });
}
