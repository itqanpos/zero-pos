import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static Future init() async {
    await Hive.initFlutter();
  }
}
