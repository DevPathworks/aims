class CategoryEntity {
  final String id;
  final String name;
  final String description;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  List<Object?> get props => [id, name, description];
}