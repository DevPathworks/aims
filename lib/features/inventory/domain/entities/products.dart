// Products | Medication

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final DateTime expiryDate;
  final String manufacturer;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.expiryDate,
    required this.manufacturer,
  });

  List<Object?> get props => [id, name, description, price, quantity, category, expiryDate, manufacturer];
}