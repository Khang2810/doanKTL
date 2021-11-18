class Category {
  final double id;
  final String categoryName;

  Category({
    required this.id,
    required this.categoryName,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "categoryName": categoryName};
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['id'] as num).toDouble(),
      categoryName: json['categoryName'],
    );
  }

  @override
  String toString() {
    return 'Category{id: $id, categoryName: $categoryName}';
  }
}
