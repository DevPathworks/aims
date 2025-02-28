class InventoryEntity {
  final String id;
  final String productId;
  final int quantity;
  final DateTime lastUpdated;

  InventoryEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.lastUpdated,
  });

  List<Object?> get props => [id, productId, quantity, lastUpdated];
}