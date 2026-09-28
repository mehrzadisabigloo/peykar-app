import 'jalali_date.dart';

extension PersianDigitExtension on String {
  String get toPersianDigit {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = this;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], persian[i]);
    }
    return result;
  }

  int get parsePersianInt {
    const persianDigits = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String englishText = this;
    for (int i = 0; i < persianDigits.length; i++) {
      englishText = englishText.replaceAll(persianDigits[i], i.toString());
    }
    final cleaned = englishText.replaceAll(RegExp(r'\D'), '');
    return int.tryParse(cleaned) ?? 0;
  }
}

extension NumPersianDigitExtension on num {
  String get toPersianDigit => toString().toPersianDigit;
}

extension JalaliFormatter on DateTime {
  String get formatJalali {
    final jalali = Jalali.fromDateTime(this);
    return '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}'.toPersianDigit;
  }
  
  String get formatJalaliRaw {
    final jalali = Jalali.fromDateTime(this);
    return '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}';
  }
}
