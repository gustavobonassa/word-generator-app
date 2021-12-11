import 'package:flutter/material.dart';
import 'package:whatword/modules/insert_word/insert_word_page.dart';
import 'package:whatword/modules/word/word_page.dart';
import 'package:whatword/modules/word_list/word_list.dart';
import 'package:whatword/shared/themes/app_colors.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          height: 50,
          color: AppColors.primary,
        ),
      ),
      body: [
        InsertWordPage(
          key: UniqueKey(),
        ),
        WordPage(
          key: UniqueKey(),
        ),
        WordListPage(
          key: UniqueKey(),
        ),
      ][_controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _controller.setPage(0);
                setState(() {});
              },
              color: _controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(28),
              ),
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  _controller.setPage(1);
                  setState(() {});
                },
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(Icons.list_alt_outlined),
              onPressed: () {
                _controller.setPage(2);
                setState(() {});
              },
              color: _controller.currentPage == 2
                  ? AppColors.primary
                  : AppColors.body,
            )
          ],
        ),
      ),
    );
  }
}
