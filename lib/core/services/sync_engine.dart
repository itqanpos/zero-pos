import 'sync_queue.dart';
import 'firestore_service.dart';

class SyncEngine {
  static Future syncProducts() async {
    final queue = await SyncQueue.getAll();

    for (var item in queue) {
      await FirestoreService.uploadProduct(item);
    }

    await SyncQueue.clear();
  }
}
