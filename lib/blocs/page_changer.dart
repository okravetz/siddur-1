
import 'package:flutter/cupertino.dart';
import 'package:siddur/pages/AfternoonPrayerPage.dart';
import 'package:siddur/pages/NightPrayerPage.dart';
import 'package:siddur/pages/about_page.dart';
import 'package:siddur/pages/bedtime_shema_page.dart';
import 'package:siddur/pages/moon_prayer_page.dart';
import 'package:siddur/pages/morning_prayer_page.dart';
import 'package:siddur/pages/study_prayer_page.dart';
import 'package:siddur/pages/travel_prayer_page.dart';
import 'package:siddur/pages/zmanim_page.dart';

class PageChanger extends ChangeNotifier{

  List<Widget> listPages = [
    BedTimeShema(),
    MorningPrayerPage(),
    TravelPrayer(),
    MoonPrayerPage(),
    StudyPrayerPage(),
    ZmanimPage(),
    AboutPage(),
    AfternoonPrayerPage(),
    NightPrayerPage(),
  ];

  int _chosenPageIndex = 1;

  PageChanger();

  getPageIndex() => _chosenPageIndex;

  getPage() => listPages[_chosenPageIndex];

  setPageIndex(int index) {
    this._chosenPageIndex = index;
    notifyListeners();
  }
}