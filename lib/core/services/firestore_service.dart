import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final _db = FirebaseFirestore.instance;

  static Future uploadProduct(Map data) async {
    await _db.collection("products").doc(data["id"]).set(data);
  }

  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final snapshot = await _db.collection("products").get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
