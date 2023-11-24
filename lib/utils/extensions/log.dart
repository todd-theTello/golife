import 'package:flutter/foundation.dart';

///log extension on object
extension on Object {
  /// print object to string
  void log() {
    if (kDebugMode) {
      print(toString());
    }
  }
}
