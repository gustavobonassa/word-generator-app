import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatword/modules/word/word_controller.dart';
import 'package:whatword/shared/models/word_model.dart';
import 'package:whatword/shared/themes/app_colors.dart';
import 'package:whatword/shared/themes/app_text_styles.dart';
import 'package:whatword/shared/widgets/input_text/input_text.dart';
import 'package:whatword/shared/widgets/label_button/label_button.dart';

class WordPage extends StatefulWidget {
  const WordPage({Key? key}) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  final _controller = WordController();
  void showWebColoredToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            children: [
              Text(
                "Word generator",
                style: TextStyles.titleBoldHeading,
              ),
              Container(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder<WordModel>(
                    valueListenable: _controller.currentWordNotifier,
                    builder: (_, currentWord, __) => Text(
                      currentWord.word ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              InputTextWidget(
                label: "Translation",
                onChanged: (value) {
                  _controller.onChange(value);
                },
              ),
              Container(
                height: 20,
              ),
              LabelButton(
                  label: "Verify",
                  onPressed: () {
                    String message = _controller.verifyWord();
                    showWebColoredToast(message);
                  }),
            ],
          )),
        ),
      ),
    );
  }
}
