import 'package:aims/features/inventory/data/models/inventory.dart';

abstract interface class InventoryRemoteDataSource {
  Future<List<InventoryModel>> getInventory();
  Future<InventoryModel> getInventoryById(String id);
  Future<void> addInventory(InventoryModel inventory);
  Future<void> updateInventory(InventoryModel inventory);
  Future<void> deleteInventory(String id);
}