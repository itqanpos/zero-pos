class Product {
  String id;
  String name;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "quantity": quantity,
    };
  }

  factory Product.fromMap(Map map) {
    return Product(
      id: map["id"],
      name: map["name"],
      price: map["price"],
      quantity: map["quantity"],
    );
  }
}
