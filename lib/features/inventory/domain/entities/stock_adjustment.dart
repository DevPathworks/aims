class StockAdjustmentEntity {
  final String id;
  final String productId;
  final int adjustedQuantity;
  final String reason;
  final DateTime date;

  StockAdjustmentEntity({
    required this.id,
    required this.productId,
    required this.adjustedQuantity,
    required this.reason,
    required this.date,
  });

  List<Object?> get props => [id, productId, adjustedQuantity, reason, date];
}