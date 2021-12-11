import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatword/modules/insert_word/insert_word_controller.dart';
import 'package:whatword/shared/themes/app_text_styles.dart';
import 'package:whatword/shared/widgets/input_text/input_text.dart';
import 'package:whatword/shared/widgets/label_button/label_button.dart';

class InsertWordPage extends StatefulWidget {
  const InsertWordPage({Key? key}) : super(key: key);

  @override
  State<InsertWordPage> createState() => _InsertWordPageState();
}

class _InsertWordPageState extends State<InsertWordPage> {
  final _controller = InsertWordController();
  final _wordController = TextEditingController();
  final _translationController = TextEditingController();
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              child: Column(
                children: [
                  Text(
                    'Add new word',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBoldHeading,
                  ),
                  Container(
                    height: 20,
                  ),
                  InputTextWidget(
                    controller: _wordController,
                    label: 'Word',
                    onChanged: (value) => _controller.onChange(word: value),
                  ),
                  Container(
                    height: 20,
                  ),
                  InputTextWidget(
                    controller: _translationController,
                    label: 'Translation',
                    onChanged: (value) =>
                        _controller.onChange(translation: value),
                  ),
                  Container(
                    height: 20,
                  ),
                  LabelButton(
                    label: 'Save',
                    onPressed: () async {
                      var ret = await _controller.saveWord();
                      if (ret) {
                        showToast('Word saved');
                      } else {
                        showToast('Error');
                      }
                      _wordController.clear();
                      _translationController.clear();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
