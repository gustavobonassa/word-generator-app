import 'package:flutter/material.dart';
import 'package:whatword/modules/word_list/word_list_controller.dart';
import 'package:whatword/shared/models/word_model.dart';
import 'package:whatword/shared/themes/app_text_styles.dart';
import 'package:whatword/shared/widgets/list_item/list_item.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({Key? key}) : super(key: key);

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  final _controller = WordListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My words',
                  style: TextStyles.titleBoldHeading,
                ),
                ValueListenableBuilder<List<WordModel>>(
                  valueListenable: _controller.wordsNotifier,
                  builder: (_, words, __) => Text(
                    words.length.toString(),
                    style: TextStyles.titleBoldHeading,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<List<WordModel>>(
              valueListenable: _controller.wordsNotifier,
              builder: (_, words, __) => words.isNotEmpty
                  ? Column(
                      children: words
                          .map((e) => ListItemWidget(
                                data: e,
                                onPressed: () {
                                  _controller.deleteWord(e);
                                  setState(() {});
                                },
                              ))
                          .toList(),
                    )
                  : Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 10,
                          ),
                          Text('No words added yet',
                              style: TextStyles.trailingRegular),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
