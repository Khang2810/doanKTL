class Example {
  final double id;
  final String exampleSentence;

  Example({
    required this.id,
    required this.exampleSentence,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "exampleSentence": exampleSentence};
  }

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      id: (json['id'] as num).toDouble(),
      exampleSentence: json['exampleSentence'],
    );
  }

  @override
  String toString() {
    return 'Example{id: $id, exampleSentence: $exampleSentence}';
  }
}
