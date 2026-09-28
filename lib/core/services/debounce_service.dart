import 'dart:async';
import 'package:flutter/foundation.dart';

class DebounceService {
  Timer? _timer;

  void run(VoidCallback action, {Duration duration = const Duration(milliseconds: 600)}) {
    if (_timer?.isActive ?? false) _timer!.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
