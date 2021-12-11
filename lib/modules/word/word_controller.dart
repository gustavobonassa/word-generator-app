import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatword/shared/models/word_model.dart';

class WordController {
  final currentWordNotifier = ValueNotifier<WordModel>(WordModel());
  WordModel get currentWord => currentWordNotifier.value;
  set currentWord(WordModel value) => currentWordNotifier.value = value;
  final _random = Random();
  List<String> goodWords = ['Very nice', 'Good', 'Nice', 'Great', 'Awesome'];
  List<String> badWords = [
    'Are you dumb?',
    'WTF! stupid',
    'loser',
    'This is not the answer',
    'Very bad'
  ];

  String wordTranslation = '';

  void onChange(String translation) {
    wordTranslation = translation;
  }

  WordController() {
    getRandomWord();
  }

  Future<List<WordModel>> getWords() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('words') ?? <String>[];
      return response.map((e) => WordModel.fromJson(e)).toList();
    } catch (e) {
      return <WordModel>[];
    }
  }

  Future<void> getRandomWord() async {
    final words = await getWords();
    final index = _random.nextInt(words.length);
    currentWord = words[index];
  }

  String verifyWord() {
    if (currentWord.translation == wordTranslation) {
      getRandomWord();
      return goodWords[_random.nextInt(goodWords.length)];
    } else {
      return badWords[_random.nextInt(badWords.length)];
    }
  }
}
