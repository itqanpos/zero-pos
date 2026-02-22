import 'package:hive/hive.dart';
import '../models/product_model.dart';

class ProductLocalService {
  static const boxName = "products";

  static Future<Box> _openBox() async {
    return await Hive.openBox(boxName);
  }

  static Future addProduct(Product product) async {
    final box = await _openBox();
    await box.put(product.id, product.toMap());
  }

  static Future<List<Product>> getProducts() async {
    final box = await _openBox();
    return box.values.map((e) => Product.fromMap(Map.from(e))).toList();
  }

  static Future deleteProduct(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
