import 'package:flutter/material.dart';
import 'dart:math';
import '../models/product_model.dart';
import '../services/product_local_service.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  Future loadProducts() async {
    products = await ProductLocalService.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void addProduct() async {
    final product = Product(
      id: Random().nextInt(999999).toString(),
      name: nameController.text,
      price: double.parse(priceController.text),
      quantity: 0,
    );

    await ProductLocalService.addProduct(product);
    nameController.clear();
    priceController.clear();
    loadProducts();
  }

  void delete(String id) async {
    await ProductLocalService.deleteProduct(id);
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: "Product Name")),
                TextField(controller: priceController, decoration: const InputDecoration(labelText: "Price")),
                ElevatedButton(onPressed: addProduct, child: const Text("Add")),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, i) {
                final p = products[i];
                return ListTile(
                  title: Text(p.name),
                  subtitle: Text("${p.price} EGP"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => delete(p.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
