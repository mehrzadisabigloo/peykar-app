class Jalali {
  final int year;
  final int month;
  final int day;

  Jalali(this.year, this.month, this.day);

  static Jalali fromDateTime(DateTime date) {
    int gYear = date.year;
    int gMonth = date.month;
    int gDay = date.day;

    List<int> gDayNo = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int gy = gYear - 1600;
    int gm = gMonth - 1;
    int gd = gDay - 1;

    int gDaySum = 365 * gy + (gy + 3) ~/ 4 - (gy + 99) ~/ 100 + (gy + 399) ~/ 400;
    for (int i = 0; i < gm; ++i) {
      gDaySum += gDayNo[i + 1];
    }
    if (gm > 1 && ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0))) {
      gDaySum++;
    }
    gDaySum += gd;

    int jDaySum = gDaySum - 79;
    int jNp = jDaySum ~/ 12053;
    jDaySum %= 12053;

    int jy = 979 + 33 * jNp + 4 * (jDaySum ~/ 1461);
    jDaySum %= 1461;

    if (jDaySum >= 366) {
      jy += (jDaySum - 1) ~/ 365;
      jDaySum = (jDaySum - 1) % 365;
    }

    int jm, jd;
    if (jDaySum < 186) {
      jm = 1 + jDaySum ~/ 31;
      jd = 1 + jDaySum % 31;
    } else {
      jm = 7 + (jDaySum - 186) ~/ 30;
      jd = 1 + (jDaySum - 186) % 30;
    }

    return Jalali(jy, jm, jd);
  }

  DateTime toDateTime() {
    int jy = year - 979;
    int jm = month - 1;
    int jd = day - 1;

    int jDaySum = 365 * jy + (jy ~/ 33) * 8 + ((jy % 33 + 3) ~/ 4);
    for (int i = 0; i < jm; ++i) {
      if (i < 6) {
        jDaySum += 31;
      } else {
        jDaySum += 30;
      }
    }
    jDaySum += jd;

    int gDaySum = jDaySum + 79;
    int gy = 1600 + 400 * (gDaySum ~/ 146097);
    gDaySum %= 146097;

    int leap = 1;
    if (gDaySum >= 36525) {
      gDaySum--;
      gy += 100 * (gDaySum ~/ 36524);
      gDaySum %= 36524;
      if (gDaySum >= 365) {
        gDaySum++;
      } else {
        leap = 0;
      }
    }

    gy += 4 * (gDaySum ~/ 1461);
    gDaySum %= 1461;

    if (gDaySum >= 366) {
      leap = 0;
      gDaySum--;
      gy += gDaySum ~/ 365;
      gDaySum %= 365;
    }

    List<int> gDayNo = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (leap == 1 && ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0))) {
      gDayNo[2] = 29;
    }

    int gm = 0;
    while (gm < 12 && gDaySum >= gDayNo[gm + 1]) {
      gDaySum -= gDayNo[gm + 1];
      gm++;
    }

    return DateTime(gy, gm + 1, gDaySum + 1);
  }

  static int monthLength(int year, int month) {
    if (month <= 6) return 31;
    if (month <= 11) return 30;
    if (isLeapYear(year)) return 30;
    return 29;
  }

  static bool isLeapYear(int year) {
    return [1, 5, 9, 13, 17, 22, 26, 30].contains(year % 33);
  }

  static const List<String> monthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Jalali &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          month == other.month &&
          day == other.day;

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
