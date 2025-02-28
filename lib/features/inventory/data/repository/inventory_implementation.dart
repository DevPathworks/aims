import 'package:aims/core/resources/data_state.dart';
import 'package:aims/features/inventory/data/models/inventory.dart';
import 'package:aims/features/inventory/domain/repositories/inventory_repository.dart';

class InventoryImplementation  implements InventoryRepository{
  @override
  Future<DataState<List<InventoryModel>>> getInventories() {
    // TODO: implement getInventories
    throw UnimplementedError();
  }

  @override
  Future<DataState<InventoryModel>> getInventory(String id) {
    // TODO: implement getInventory
    throw UnimplementedError();
  }
}