import 'package:okbarter2/core/globals/globals.dart';
import 'package:okbarter2/core/services/local_db.dart';

class CurrentUser {
  static final CurrentUser _instance = CurrentUser._internal();
  CurrentUser._internal();
  factory CurrentUser() => _instance;

  Map userDetails = {};

  init() {
    userDetails = LocalDb().userBox.get("details") ?? {};
    logger.d(userDetails);
  }

  save(Map data) {
    userDetails = data;
    LocalDb().userBox.put("details", data);
  }

  clear() {
    userDetails.clear();
  }
}
