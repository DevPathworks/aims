import 'package:aims/core/resources/data_state.dart';
import 'package:aims/features/inventory/domain/entities/inventory.dart';

abstract class InventoryRepository {
  Future<DataState<List<InventoryEntity>>> getInventories();
  Future<DataState<InventoryEntity>> getInventory(String id);
}