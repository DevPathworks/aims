// Suppliers | Manufacturers
class SupplierEntity {
  final String id;
  final String name;
  final String contactPerson;
  final String phoneNumber;
  final String email;
  final String address;

  SupplierEntity({
    required this.id,
    required this.name,
    required this.contactPerson,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  List<Object?> get props => [id, name, contactPerson, phoneNumber, email, address];
}