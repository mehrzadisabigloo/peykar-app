class PersianFormatter {
  PersianFormatter._();
  static const List<String> _fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  
  static String digits(String input) {
    final buffer = StringBuffer();
    for (final rune in input.runes) {
      final char = String.fromCharCode(rune);
      final digit = int.tryParse(char);
      buffer.write(digit != null ? _fa[digit] : char);
    }
    return buffer.toString();
  }
  
  static String price(num value) {
    final raw = value.toInt().toString();
    final grouped = raw.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => ',',
    );
    return digits(grouped);
  }
}
