import 'dart:convert';

class WordModel {
  final String? word;
  final String? translation;

  WordModel({
    this.word,
    this.translation,
  });
  final bool enabled = true;

  WordModel copyWith({
    String? word,
    String? translation,
  }) {
    return WordModel(
      word: word ?? this.word,
      translation: translation ?? this.translation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'translation': translation,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'],
      translation: map['translation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));

  @override
  String toString() => 'WordModel(word: $word, translation: $translation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.word == word &&
        other.translation == translation;
  }

  @override
  int get hashCode => word.hashCode ^ translation.hashCode;
}
