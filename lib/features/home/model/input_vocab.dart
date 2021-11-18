class InputVocab{

  final String vocabName;
  final String vocabVietnameseName;
  final String vocabMeaning;
  final String vocabImageUrl;
  final List<String> categories;
  final List<String> examples;

  InputVocab(this.vocabName, this.vocabVietnameseName, this.vocabMeaning,
      this.vocabImageUrl, this.categories, this.examples);

  Map<String, dynamic> toJson() {
    return {
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
    return 'InputVocab{vocabName: $vocabName, vocabVietnameseName: $vocabVietnameseName, vocabMeaning: $vocabMeaning, vocabImageUrl: $vocabImageUrl, categories: $categories, examples: $examples}';
  }
}