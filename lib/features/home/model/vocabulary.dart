import 'package:doanktl/features/home/model/category.dart';
import 'package:doanktl/features/home/model/example.dart';

class Vocabulary {
  final double id;
  final String vocabName;
  final String vocabVietnameseName;
  final String vocabMeaning;
  final String vocabImageUrl;
  final List<Category> categories;
  final List<Example> examples;

  Vocabulary({
    required this.id,
    required this.vocabName,
    required this.vocabVietnameseName,
    required this.vocabMeaning,
    required this.vocabImageUrl,
    required this.categories,
    required this.examples,
  });

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    var categoryObjJson = json['categories'] as List;
    var exampleObjJson = json['examples'] as List;
    List<Example> _examples =
        exampleObjJson.map((example) => Example.fromJson(example)).toList();
    List<Category> _categories =
        categoryObjJson.map((category) => Category.fromJson(category)).toList();
    return Vocabulary(
      id: (json['id'] as num).toDouble(),
      vocabName: json['vocabName'],
      vocabVietnameseName: json['vocabVietnameseName'],
      vocabMeaning: json['vocabMeaning'],
      vocabImageUrl: json['vocabImageUrl'],
      categories: _categories,
      examples: _examples,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "vocabName": vocabName,
      "vocabVietnameseName": vocabVietnameseName,
      "vocabMeaning": vocabMeaning,
      "vocabImageUrl": vocabImageUrl,
      "categories": categories,
      "examples": examples
    };
  }

  @override
  String toString() {
    return 'Vocabulary{id: $id, vocabName: $vocabName, vocabVietnameseName: $vocabVietnameseName, vocabMeaning: $vocabMeaning, vocabImageUrl: $vocabImageUrl, categories: $categories, examples: $examples}';
  }
}
