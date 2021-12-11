import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatword/shared/models/word_model.dart';

class WordListController {
  final wordsNotifier = ValueNotifier<List<WordModel>>([]);
  List<WordModel> get words => wordsNotifier.value;
  set words(List<WordModel> value) => wordsNotifier.value = value;

  WordListController() {
    getWords();
  }

  Future<void> getWords() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('words') ?? <String>[];
      words = response.map((e) => WordModel.fromJson(e)).toList();
    } catch (e) {
      words = <WordModel>[];
    }
  }

  Future<void> deleteWord(WordModel wordToDelete) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('words') ?? <String>[];
      response.remove(wordToDelete.toJson());
      await instance.setStringList('words', response);
      words = response.map((e) => WordModel.fromJson(e)).toList();
      return;
    } catch (e) {
      print(e);
    }
  }
}
