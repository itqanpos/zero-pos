import 'package:hive/hive.dart';

class SyncQueue {
  static const boxName = "sync_queue";

  static Future<Box> _open() async {
    return await Hive.openBox(boxName);
  }

  static Future add(Map data) async {
    final box = await _open();
    await box.add(data);
  }

  static Future<List<Map>> getAll() async {
    final box = await _open();
    return box.values.map((e) => Map.from(e)).toList();
  }

  static Future clear() async {
    final box = await _open();
    await box.clear();
  }
}
