import 'package:aims/features/inventory/domain/entities/inventory.dart';

class InventoryModel extends InventoryEntity {
  InventoryModel(
      {required super.id,
      required super.productId,
      required super.quantity,
      required super.lastUpdated}
  );

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      lastUpdated: json['lastUpdated'],
    );
  }
}
