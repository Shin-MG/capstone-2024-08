import 'package:capstone/constants/color.dart' as colors;
import 'package:capstone/constants/text.dart' as texts;
import 'package:capstone/screen/setting/setting.dart';
import 'package:capstone/widget/home/attendance_streak.dart';
import 'package:capstone/widget/home/character_section.dart';
import 'package:capstone/widget/script/script_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final User? user = FirebaseAuth.instance.currentUser;
  // final LoadData loadData = LoadData();

  String nickname = "로로";

  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: colors.bgrDarkColor,
      // text overflow 반영 필요 : libary로 화면 비율에 따른 조정 반영 필요
      title: Text("${texts.homeWelcomeMessage} $nickname님 !",
          style: const TextStyle(
              color: colors.themeWhiteColor, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_rounded, color: Colors.white),
          onPressed: () {
            HapticFeedback.lightImpact();
            Get.to(() => const Setting());
          },
        )
      ],
    );
  }

  Widget _characterSection() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: characterSection('carrot'));
  }

  Widget _attendanceStreak() {
    return Container(child: attendanceStreak(nickname, 8));
  }

  Widget _lastPracticeScript() {
    return Container(
        child: Text(
      '최근 연습 대본',
      style: TextStyle(color: colors.themeWhiteColor),
    ));
    // return scriptListTile(context, );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.bgrDarkColor,
        appBar: homeAppBar(),
        body: Column(children: [
          _characterSection(),
          _lastPracticeScript(),
          _attendanceStreak()
        ]));
  }
}
