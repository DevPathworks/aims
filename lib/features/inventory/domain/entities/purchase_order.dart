class PurchaseOrderEntity {
  final String id;
  final String supplierId;
  final DateTime orderDate;
  final DateTime expectedDeliveryDate;
  final String status;

  PurchaseOrderEntity({
    required this.id,
    required this.supplierId,
    required this.orderDate,
    required this.expectedDeliveryDate,
    required this.status,
  });

  List<Object?> get props => [id, supplierId, orderDate, expectedDeliveryDate, status];
}