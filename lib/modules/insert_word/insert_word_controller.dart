import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatword/shared/models/word_model.dart';

class InsertWordController {
  WordModel newWord = WordModel();

  void onChange({String? word, String? translation}) {
    newWord = newWord.copyWith(word: word, translation: translation);
  }

  Future<bool> saveWord() async {
    if (newWord.word == null || newWord.translation == null) {
      return false;
    }
    try {
      final instance = await SharedPreferences.getInstance();
      final words = instance.getStringList('words') ?? <String>[];
      words.add(newWord.toJson());
      await instance.setStringList('words', words);
      newWord = WordModel();
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
