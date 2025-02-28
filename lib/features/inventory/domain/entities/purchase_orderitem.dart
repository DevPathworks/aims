class PurchaseOrderItemEntity {
  final String id;
  final String purchaseOrderId;
  final String productId;
  final int quantity;
  final double price;

  PurchaseOrderItemEntity({
    required this.id,
    required this.purchaseOrderId,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  List<Object?> get props => [id, purchaseOrderId, productId, quantity, price];
}