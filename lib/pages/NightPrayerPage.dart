import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:siddur/tools/hebrewcalendar/jewish_calendar.dart';
import 'package:siddur/ui-elements/song_of_the_day_widget.dart';

import 'CustomDrawer.dart';

class NightPrayerPage extends StatefulWidget {
  @override
  _NightPageState createState() => _NightPageState();
}

class _NightPageState extends State<NightPrayerPage> {
  ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();

  // TODO: Implement pinch to zoom
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  final TODAY = DateTime.now();
  final JEWISH_DATE_TODAY = JewishCalendar.fromDateTime(DateTime.now());
  final IS_TAANITH = JewishCalendar.fromDateTime(DateTime.now()).isTaanis();
  final IS_TEN_DAYS = JewishCalendar.fromDateTime(DateTime.now()).isTenDays();
  final IS_TACHANUN = JewishCalendar.fromDateTime(DateTime.now()).isTachanunMinche();


  List<Widget> nightPrayers = [
    // Shema
    Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְהוּא רַחוּם יְכַפֵּר עָון וְלא יַשְׁחִית. וְהִרְבָּה לְהָשִׁיב אַפּו וְלא יָעִיר כָּל חֲמָתו: ה' הושִׁיעָה. הַמֶּלֶךְ יַעֲנֵנוּ בְיום קָרְאֵנוּ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרְכוּ אֶת ה’ הַמְברָךְ. \nבָּרוּךְ ה' הַמְברָךְ לְעולָם וָעֶד.",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרוּךְ אַתָּה ה'. אֱלהֵינוּ מֶלֶךְ הָעולָם. אֲשֶׁר בִּדְבָרו מַעֲרִיב עֲרָבִים. בְּחָכְמָה פּותֵחַ שְׁעָרִים. וּבִתְבוּנָה מְשַׁנֶּה עִתִּים וּמַחֲלִיף אֶת הַזְּמַנִּים. וּמְסַדֵּר אֶת הַכּוכָבִים בְּמִשְׁמְרותֵיהֶם בָּרָקִיעַ כִּרְצונו. בּורֵא יום וָלָיְלָה. גּולֵל אור מִפְּנֵי חשֶׁךְ וְחשֶׁךְ מִפְּנֵי אור. וּמַעֲבִיר יום וּמֵבִיא לָיְלָה. וּמַבְדִּיל בֵּין יום וּבֵין לָיְלָה. ה' צְבָאות שְׁמו: אֵל חַי וְקַיָּם תָּמִיד יִמְלוךְ עָלֵינוּ לְעולָם וָעֶד: בָּרוּךְ אַתָּה ה', הַמַּעֲרִיב עֲרָבִים:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אַהֲבַת עולָם בֵּית יִשרָאֵל עַמְּךָ אָהָבְתָּ. תּורָה וּמִצְות חֻקִּים וּמִשְׁפָּטִים אותָנוּ לִמַּדְתָּ. עַל כֵּן ה' אֱלהֵינוּ בְּשָׁכְבֵנוּ וּבְקוּמֵנוּ נָשיחַ בְּחֻקֶּיךָ. וְנִשמַח בְּדִבְרֵי תורָתֶךָ וּבְמִצְותֶיךָ לְעולָם וָעֶד: כִּי הֵם חַיֵּינוּ וְארֶךְ יָמֵינוּ וּבָהֶם נֶהְגֶּה יומָם וָלָיְלָה: וְאַהֲבָתְךָ אַל תָּסִיר מִמֶּנּוּ לְעולָמִים. בָּרוּךְ אַתָּה ה'. אוהֵב עַמּו יִשרָאֵל:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "יחיד אומר: אֵל מֶלֶךְ נֶאֱמָן:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 20),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "שְׁמַע יִשרָאֵל ה' אֱלהֵינוּ ה' אֶחָד:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 28),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרוּךְ שֵׁם כְּבוד מַלְכוּתו לְעולָם וָעֶד:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 20),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְאָהַבְתָּ אֵת ה' אֱלהֶיךָ בְּכָל לְבָבְךָ וּבְכָל נַפְשְׁךָ וּבְכָל מְאדֶךָ: וְהָיוּ הַדְּבָרִים הָאֵלֶּה אֲשֶׁר אָנכִי מְצַוְּךָ הַיּום עַל לְבָבֶךָ: וְשִׁנַּנְתָּם לְבָנֶיךָ וְדִבַּרְתָּ בָּם בְּשִׁבְתְּךָ בְּבֵיתֶךָ וּבְלֶכְתְּךָ בַדֶּרֶךְ וּבְשָׁכְבְּךָ וּבְקוּמֶךָ: וּקְשַׁרְתָּם לְאות עַל יָדֶךָ וְהָיוּ לְטטָפת בֵּין עֵינֶיךָ: וּכְתַבְתָּם עַל מְזֻזות בֵּיתֶךָ וּבִשְׁעָרֶיךָ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְהָיָה אִם שָׁמעַ תִּשְׁמְעוּ אֶל מִצְותַי אֲשֶׁר אָנכִי מְצַוֶּה אֶתְכֶם הַיּום לְאַהֲבָה אֶת ה' אֱלהֵיכֶם וּלְעָבְדו בְּכָל לְבַבְכֶם וּבְכָל נַפְשְׁכֶם: וְנָתַתִּי מְטַר אַרְצְכֶם בְּעִתּו יורֶה וּמַלְקושׁ וְאָסַפְתָּ דְגָנֶךָ וְתִירשְׁךָ וְיִצְהָרֶךָ: וְנָתַתִּי עֵשב בְּשדְךָ לִבְהֶמְתֶּךָ וְאָכַלְתָּ וְשבָעְתָּ: הִשָּׁמְרוּ לָכֶם פֶּן יִפְתֶּה לְבַבְכֶם וְסַרְתֶּם וַעֲבַדְתֶּם אֱלהִים אֲחֵרִים וְהִשְׁתַּחֲוִיתֶם לָהֶם: וְחָרָה אַף ה' בָּכֶם וְעָצַר אֶת הַשָּׁמַיִם וְלא יִהְיֶה מָטָר וְהָאֲדָמָה לא תִתֵּן אֶת יְבוּלָהּ וַאֲבַדְתֶּם מְהֵרָה מֵעַל הָאָרֶץ הַטּבָה אֲשֶׁר ה' נתֵן לָכֶם: וְשמְתֶּם אֶת דְּבָרַי אֵלֶּה עַל לְבַבְכֶם וְעַל נַפְשְׁכֶם וּקְשַׁרְתֶּם אתָם לְאות עַל יֶדְכֶם וְהָיוּ לְטוטָפת בֵּין עֵינֵיכֶם: וְלִמַּדְתֶּם אתָם אֶת בְּנֵיכֶם לְדַבֵּר בָּם בְּשִׁבְתְּךָ בְּבֵיתֶךָ וּבְלֶכְתְּךָ בַדֶּרֶךְ וּבְשָׁכְבְּךָ וּבְקוּמֶךָ: וּכְתַבְתָּם עַל מְזוּזות בֵּיתֶךָ וּבִשְׁעָרֶיךָ: לְמַעַן יִרְבּוּ יְמֵיכֶם וִימֵי בְנֵיכֶם עַל הָאֲדָמָה אֲשֶׁר נִשְׁבַּע ה' לַאֲבתֵיכֶם לָתֵת לָהֶם כִּימֵי הַשָּׁמַיִם עַל הָאָרֶץ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וַיּאמֶר ה' אֶל משֶׁה לֵּאמר: דַּבֵּר אֶל בְּנֵי יִשרָאֵל וְאָמַרְתָּ אֲלֵהֶם וְעָשוּ לָהֶם צִיצִת עַל כַּנְפֵי בִגְדֵיהֶם לְדרתָם וְנָתְנוּ עַל צִיצִת הַכָּנָף פְּתִיל תְּכֵלֶת: וְהָיָה לָכֶם לְצִיצִת וּרְאִיתֶם אתו וּזְכַרְתֶּם אֶת כָּל מִצְות ה' וַעֲשיתֶם אתָם וְלא תָתוּרוּ אַחֲרֵי לְבַבְכֶם וְאַחֲרֵי עֵינֵיכֶם אֲשֶׁר אַתֶּם זנִים אַחֲרֵיהֶם: לְמַעַן תִּזְכְּרוּ וַעֲשיתֶם אֶת כָּל מִצְותָי וִהְיִיתֶם קְדשִׁים לֵאלהֵיכֶם: אֲנִי ה' אֱלהֵיכֶם אֲשֶׁר הוצֵאתִי אֶתְכֶם מֵאֶרֶץ מִצְרַיִם לִהְיות לָכֶם לֵאלהִים אֲנִי ה' אֱלהֵיכֶם.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אֱמֶת וֶאֱמוּנָה כָּל זאת וְקַיָּם עָלֵינוּ. כִּי הוּא ה' אֱלהֵינוּ וְאֵין זוּלָתו. וַאֲנַחְנוּ יִשרָאֵל עַמּו: הַפּודֵנוּ מִיַּד מְלָכִים. מַלְכֵּנוּ הַגּואֲלֵנוּ מִכַּף כָּל הֶעָרִיצִים. הָאֵל הַנִּפְרָע לָנוּ מִצָּרֵינוּ. וְהַמְשַׁלֵּם גְּמוּל לְכָל אויְבֵי נַפְשֵׁנוּ: הָעושה גְדולות עַד אֵין חֵקֶר. נִסִּים וְנִפְלָאות עַד אֵין מִסְפָּר. הַשּם נַפְשֵׁנוּ בַּחַיִּים. וְלא נָתַן לַמּוט רַגְלֵנוּ: הַמַּדְרִיכֵנוּ עַל בָּמות אויְבֵינוּ. וַיָּרֶם קַרְנֵנוּ עַל כָּל שונְאֵינוּ: הָעושה לָּנוּ נִסִּים וּנְקָמָה בְּפַרְעה. אותות וּמופְתִים בְּאַדְמַת בְּנֵי חָם. הַמַּכֶּה בְעֶבְרָתו כָּל בְּכורֵי מִצְרָיִם. וַיּוצֵא אֶת עַמּו יִשרָאֵל מִתּוכָם לְחֵרוּת עולָם: הַמַּעֲבִיר בָּנָיו בֵּין גִּזְרֵי יַם סוּף. אֶת רודְפֵיהֶם וְאֶת שונְאֵיהֶם בִּתְהומות טִבַּע. וְרָאוּ בָנָיו גְּבוּרָתו. שִׁבְּחוּ וְהודוּ לִשְׁמו: וּמַלְכוּתו בְּרָצון קִבְּלוּ עֲלֵיהֶם. משֶׁה וּבְנֵי יִשרָאֵל לְךָ עָנוּ שִׁירָה בְּשמְחָה רַבָּה. וְאָמְרוּ כֻלָּם:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מִי כָמכָה בָּאֵלִים ה'. מִי כָּמכָה נֶאְדָּר בַּקּדֶשׁ. נורָא תְהִלּות עשה פֶלֶא:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מַלְכוּתְךָ רָאוּ בָנֶיךָ. בּוקֵעַ יָם לִפְנֵי משֶׁה. זֶה אֵלִי עָנוּ. וְאָמְרוּ:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ה' יִמְלךְ לְעלָם וָעֶד:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְנֶאֱמַר. כִּי פָדָה ה' אֶת יַעֲקב. וּגְאָלו מִיַּד חָזָק מִמֶּנּוּ: בָּרוּךְ אַתָּה ה'. גָּאַל יִשרָאֵל:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "הַשְׁכִּיבֵנוּ ה' אֱלהֵינוּ לְשָׁלום, וְהַעֲמִידֵנוּ מַלְכֵּנוּ לְחַיִּים. וּפְרוש עָלֵינוּ סֻכַּת שְׁלומֶךָ. וְתַקְּנֵנוּ בְּעֵצָה טובָה מִלְּפָנֶיךָ. וְהושִׁיעֵנוּ לְמַעַן שְׁמֶךָ. וְהָגֵן בַּעֲדֵנוּ: וְהָסֵר מֵעָלֵינוּ אויֵב דֶבֶר וְחֶרֶב וְרָעָב וְיָגון. וְהָסֵר שטָן מִלְפָנֵינוּ וּמֵאַחֲרֵינוּ. וּבְצֵל כְּנָפֶיךָ תַּסְתִּירֵנוּ. כִּי אֵל שׁומְרֵנוּ וּמַצִּילֵנוּ אָתָּה. כִּי אֵל מֶלֶךְ חַנּוּן וְרַחוּם אָתָּה: וּשְׁמור צֵאתֵנוּ וּבואֵנוּ לְחַיִים וּלְשָׁלום מֵעַתָּה וְעַד עולָם: בָּרוּךְ אַתָּה ה' שׁומֵר עַמּו יִשרָאֵל לָעַד:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Center(
                      child: Text(
                        "Kaddish",
                      )),
                  children: [
                    Text(
                      "יִתְגַּדֵּל וְיִתְקַדֵּשׁ שְׁמֵהּ רַבָּא.\nבְּעָלְמָא דִּי בְרָא כִּרְעוּתֵהּ וְיַמְלִיךְ מַלְכוּתֵהּ בְּחַיֵּיכון וּבְיומֵיכון וּבְחַיֵּי דְכָל בֵּית יִשרָאֵל, בַּעֲגָלָא וּבִזְמַן קָרִיב, וְאִמְרוּ אָמֵן.\nיְהֵא שְׁמֵהּ רַבָּא מְבָרַךְ לְעָלַם וּלְעָלְמֵי עָלְמַיָּא.\nיִתְבָּרַךְ וְיִשְׁתַּבַּח וְיִתְפָּאַר וְיִתְרומַם וְיִתְנַשׁא וְיִתְהַדַּר וְיִתְעַלֶּה שְׁמֵהּ דְּקֻדְשָׁא. בְּרִיךְ הוּא.\nלְעֵלָּא מִן כָּל בִּרְכָתָא וְשִׁירָתָא תֻּשְׁבְּחָתָא וְנֶחֱמָתָא דַּאֲמִירָן בְּעָלְמָא, וְאִמְרוּ אָמֵן.",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.suezOne(fontSize: 24),
                    )
                  ],
                ),
              ),
            )),

      ],
    ),
    // Shmonei Esrei
    Column(
      children: [
        Padding(padding: const EdgeInsets.all(16.0), child: Container()),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אֲדנָי שפָתַי תִּפְתָּח וּפִי יַגִּיד תְּהִלָּתֶךָ:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרוּךְ אַתָּה ה' אֱלהֵינוּ וֵאלהֵי אֲבותֵינוּ. אֱלהֵי אַבְרָהָם. אֱלהֵי יִצְחָק. וֵאלהֵי יַעֲקב. הָאֵל הַגָּדול הַגִּבּור וְהַנּורָא אֵל עֶלְיון. גּומֵל חֲסָדִים טובִים. וְקונֵה הַכּל. וְזוכֵר חַסְדֵּי אָבות. וּמֵבִיא גואֵל לִבְנֵי בְנֵיהֶם לְמַעַן שְׁמו בְּאַהֲבָה.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מֶלֶךְ עוזֵר וּמושִׁיעַ וּמָגֵן: בָּרוּךְ אַתָּה ה', מָגֵן אַבְרָהָם:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אַתָּה גִּבּור לְעולָם אֲדנָי. מְחַיֵּה מֵתִים אַתָּה רַב לְהושִׁיעַ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isWinter()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מַשִּׁיב הָרוּחַ וּמורִיד הַגֶּשֶׁׁם,",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מַשִּׁיב הָרוּחַ וּמורִיד הַטַּל,",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מְכַלְכֵּל חַיִּים בְּחֶסֶד. מְחַיֶּה מֵתִים בְּרַחֲמִים רַבִּים. סומֵךְ נופְלִים. וְרופֵא חולִים וּמַתִּיר אֲסוּרִים. וּמְקַיֵּם אֱמוּנָתו לִישֵׁנֵי עָפָר. מִי כָמוךָ בַּעַל גְּבוּרות וּמִי דומֶה לָּךְ. מֶלֶךְ מֵמִית וּמְחַיֶּה וּמַצְמִיחַ יְשׁוּעָה.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְנֶאֱמָן אַתָּה לְהַחֲיות מֵתִים: בָּרוּךְ אַתָּה ה', מְחַיֵּה הַמֵּתִים.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Center(
                      child: Text(
                        "Keddusha",
                      )),
                  children: [
                    Text(
                      "בחזרת הש”ץ:\nנְקַדֵּשׁ אֶת שִׁמְךָ בָּעולָם. כְּשֵׁם שֶׁמַּקְדִּישִׁים אותו בִּשְׁמֵי מָרום. כַּכָּתוּב עַל יַד נְבִיאֶךָ: וְקָרָא זֶה אֶל זֶה וְאָמַר:\nקו”ח: קָדושׁ. קָדושׁ. קָדושׁ ה' צְבָאות. מְלא כָל הָאָרֶץ כְּבודו:\nחזן: לְעֻמָתָם בָּרוּךְ יאמֵרוּ:\nקו”ח: בָּרוּךְ כְּבוד ה' מִמְּקומו:\nחזן: וּבְדִבְרֵי קָדְשְׁךָ כָּתוּב לֵאמר:",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.suezOne(fontSize: 24),
                    ),
                    JewishCalendar.fromDateTime(DateTime.now()).isTenDays()
                        ? Text(
                      "לחזן: לְדור וָדור נַגִּיד גָּדְלֶךָ וּלְנֵצַח נְצָחִים קְדֻשָּׁתְךָ נַקְדִּישׁ. וְשִׁבְחֲךָ אֱלהֵינוּ מִפִּינוּ לא יָמוּשׁ לְעולָם וָעֶד. כִּי אֵל מֶלֶךְ גָּדול וְקָדושׁ אָתָּה: בָּרוּךְ אַתָּה ה' הַמֶּלֶךְ הַקָּדושׁ.",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.suezOne(fontSize: 24),
                    )
                        : Text(
                      "לחזן: לְדור וָדור נַגִּיד גָּדְלֶךָ וּלְנֵצַח נְצָחִים קְדֻשָּׁתְךָ נַקְדִּישׁ. וְשִׁבְחֲךָ אֱלהֵינוּ מִפִּינוּ לא יָמוּשׁ לְעולָם וָעֶד. כִּי אֵל מֶלֶךְ גָּדול וְקָדושׁ אָתָּה: בָּרוּךְ אַתָּה ה' הָאֵל הַקָּדושׁ.",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.suezOne(fontSize: 24),
                    )
                  ],
                ),
              ),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isTenDays()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אַתָּה קָדושׁ וְשִׁמְךָ קָדושׁ וּקְדושִׁים בְּכָל יום יְהַלְּלוּךָ סֶּלָה: בָּרוּךְ אַתָּה ה', הַמֶּלֶךְ הַקָּדושׁ",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אַתָּה קָדושׁ וְשִׁמְךָ קָדושׁ וּקְדושִׁים בְּכָל יום יְהַלְּלוּךָ סֶּלָה: בָּרוּךְ אַתָּה ה', הָאֵל הַקָּדושׁ",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אַתָּה חונֵן לְאָדָם דַּעַת. וּמְלַמֵּד לֶאֱנושׁ בִּינָה: חָנֵּנוּ מֵאִתְּךָ דֵעָה בִּינָה וְהַשכֵּל. בָּרוּךְ אַתָּה ה', חונֵן הַדָּעַת:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "הֲשִׁיבֵנוּ אָבִינוּ לְתורָתֶךָ, וְקָרְבֵנוּ מַלְכֵּנוּ לַעֲבודָתֶךָ, וְהַחֲזִירֵנוּ בִּתְשׁוּבָה שְׁלֵמָה לְפָנֶיךָ. בָּרוּךְ אַתָּה ה', הָרוצֶה בִּתְשׁוּבָה:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "סְלַח לָנוּ אָבִינוּ כִּי חָטָאנוּ. מְחַל לָנוּ מַלְכֵּנוּ כִּי פָשָׁעְנוּ. כִּי מוחֵל וְסולֵחַ אַתָּה. בָּרוּךְ אַתָּה ה', חַנּוּן הַמַּרְבֶּה לִסְלחַ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "רְאֵה נָא בְעָנְיֵנוּ, וְרִיבָה רִיבֵנוּ, וּגְאָלֵנוּ מְהֵרָה לְמַעַן שְׁמֶךָ, כִּי גּואֵל חָזָק אַתָּה. בָּרוּךְ אַתָּה ה', גּואֵל יִשרָאֵל:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "רְפָאֵנוּ ה' וְנֵרָפֵא, הושִׁיעֵנוּ וְנִוָּשֵׁעָה, כִּי תְהִלָּתֵנוּ אָתָּה. וְהַעֲלֵה רְפוּאָה שְׁלֵמָה לְכָל מַכּותֵינוּ, כִּי אֵל מֶלֶךְ רופֵא נֶאֱמָן וְרַחֲמָן אַתָּה. בָּרוּךְ אַתָּה ה', רופֵא חולֵי עַמּו יִשרָאֵל.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isWinter()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרֵךְ עָלֵינוּ ה' אֱלהֵינוּ אֶת הַשָּׁנָה הַזּאת וְאֶת כָּל מִינֵי תְבוּאָתָהּ לְטובָה. וְתֵן טַל וּמָטָר לִבְרָכָה עַל פְּנֵי הָאֲדָמָה וְשבְּעֵנוּ מִטּוּבָהּ. וּבָרֵךְ שְׁנָתֵנוּ כַּשָּׁנִים הַטּובות. בָּרוּךְ אַתָּה ה', מְבָרֵךְ הַשָּׁנִים:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרֵךְ עָלֵינוּ ה' אֱלהֵינוּ אֶת הַשָּׁנָה הַזּאת וְאֶת כָּל מִינֵי תְבוּאָתָהּ לְטובָה. וְתֵן בְּרָכָה עַל פְּנֵי הָאֲדָמָה וְשבְּעֵנוּ מִטּוּבָהּ. וּבָרֵךְ שְׁנָתֵנוּ כַּשָּׁנִים הַטּובות. בָּרוּךְ אַתָּה ה', מְבָרֵךְ הַשָּׁנִים:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "תְּקַע בְּשׁופָר גָּדול לְחֵרוּתֵנוּ. וְשא נֵס לְקַבֵּץ גָּלֻיּותֵינוּ. וְקַבְּצֵנוּ יַחַד מֵאַרְבַּע כַּנְפות הָאָרֶץ. בָּרוּךְ אַתָּה ה', מְקַבֵּץ נִדְחֵי עַמּו יִשרָאֵל:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isTenDays()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "הָשִׁיבָה שׁופְטֵינוּ כְּבָרִאשׁונָה וְיועֲצֵינוּ כְּבַתְּחִלָּה. וְהָסֵר מִמֶּנּוּ יָגון וַאֲנָחָה. וּמְלךְ עָלֵינוּ אַתָּה ה' לְבַדְּךָ בְּחֶסֶד וּבְרַחֲמִים. וְצַדְּקֵנוּ בַּמִשְׁפָּט. בָּרוּךְ אַתָּה ה',הַמֶּלֶךְ הַמִשְׁפָּט:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "הָשִׁיבָה שׁופְטֵינוּ כְּבָרִאשׁונָה וְיועֲצֵינוּ כְּבַתְּחִלָּה. וְהָסֵר מִמֶּנּוּ יָגון וַאֲנָחָה. וּמְלךְ עָלֵינוּ אַתָּה ה' לְבַדְּךָ בְּחֶסֶד וּבְרַחֲמִים. וְצַדְּקֵנוּ בַּמִשְׁפָּט. בָּרוּךְ אַתָּה ה', מֶלֶךְ אוהֵב צְדָקָה וּמִשְׁפָּט:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְלַמַּלְשִׁינִים אַל תְּהִי תִקְוָה. וְכָל הָרִשְׁעָה כְּרֶגַע תּאבֵד. וְכָל אויְבֵי עַמְּךָ מְהֵרָה יִכָּרֵתוּ. וְהַזֵדִים מְהֵרָה תְעַקֵּר וּתְשַׁבֵּר וּתְמַגֵּר וְתַכְנִיעַ בִּמְהֵרָה בְיָמֵינוּ. בָּרוּךְ אַתָּה ה', שׁובֵר אויְבִים וּמַכְנִיעַ זֵדִים:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עַל הַצַּדִּיקִים וְעַל הַחֲסִידִים. וְעַל זִקְנֵי עַמְּךָ בֵּית יִשרָאֵל. וְעַל פְּלֵיטַת סופְרֵיהֶם. וְעַל גֵּרֵי הַצֶּדֶק. וְעָלֵינוּ. יֶהֱמוּ רַחֲמֶיךָ ה' אֱלהֵינוּ. וְתֵן שכָר טוב לְכָל הַבּוטְחִים בְּשִׁמְךָ בֶּאֱמֶת. וְשים חֶלְקֵנוּ עִמָּהֶם לְעולָם וְלא נֵבושׁ כִּי בְךָ בָטָחְנוּ. בָּרוּךְ אַתָּה ה', מִשְׁעָן וּמִבְטָח לַצַּדִּיקִים:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְלִירוּשָׁלַיִם עִירְךָ בְּרַחֲמִים תָּשׁוּב. וְתִשְׁכּן בְּתוכָהּ כַּאֲשֶׁר דִּבַּרְתָּ. וּבְנֵה אותָהּ בְּקָרוב בְּיָמֵינוּ בִּנְיַן עולָם. וְכִסֵּא דָוִד מְהֵרָה לְתוכָהּ תָּכִין: בָּרוּךְ אַתָּה ה', בּונֵה יְרוּשָׁלָיִם:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אֶת צֶמַח דָּוִד עַבְדְּךָ מְהֵרָה תַצְמִיחַ. וְקַרְנו תָּרוּם בִּישׁוּעָתֶךָ. כִּי לִישׁוּעָתְךָ קִוִּינוּ כָּל הַיּום. בָּרוּךְ אַתָּה ה', מַצְמִיחַ קֶרֶן יְשׁוּעָה:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "שְׁמַע קולֵנוּ. ה' אֱלהֵינוּ חוּס וְרַחֵם עָלֵינוּ. וְקַבֵּל בְּרַחֲמִים וּבְרָצון אֶת תְּפִלָּתֵנוּ. כִּי אֵל שׁומֵעַ תְּפִלּות וְתַחֲנוּנִים אָתָּה. וּמִלְּפָנֶיךָ מַלְכֵּנוּ. רֵיקָם אַל תְּשִׁיבֵנוּ: כִּי אַתָּה שׁומֵעַ תְּפִלַּת עַמְּךָ יִשרָאֵל בְּרַחֲמִים. בָּרוּךְ אַתָּה ה', שׁומֵעַ תְּפִלָּה:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "רְצֵה ה' אֱלהֵינוּ בְּעַמְּךָ יִשרָאֵל וּבִתְפִלָּתָם וְהָשֵׁב אֶת הָעֲבודָה לִדְבִיר בֵּיתֶךָ. וְאִשֵּׁי יִשרָאֵל וּתְפִלָּתָם. בְּאַהֲבָה תְקַבֵּל בְּרָצון. וּתְהִי לְרָצון תָּמִיד עֲבודַת יִשרָאֵל עַמֶּךָ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isRoshChodesh()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אֱלהֵינוּ וֵאלהֵי אֲבותֵינוּ. יַעֲלֶה וְיָבוא וְיַגִּיעַ. וְיֵרָאֶה וְיֵרָצֶה וְיִשָּׁמַע. וְיִפָּקֵד וְיִזָּכֵר זִכְרונֵנוּ וּפִקְדונֵנוּ וְזִכְרון אֲבותֵינוּ. וְזִכְרון מָשִׁיחַ בֶּן דָּוִד עַבְדֶּךָ. וְזִכְרון יְרוּשָׁלַיִם עִיר קָדְשֶׁךָ. וְזִכְרון כָּל עַמְּךָ בֵּית יִשרָאֵל. לְפָנֶיךָ. לִפְלֵיטָה לְטובָה. לְחֵן וּלְחֶסֶד וּלְרַחֲמִים. לְחַיִּים וּלְשָׁלום בְּיום ראשׁ הַחדֶשׁ הַזֶּה. זָכְרֵנוּ ה' אֱלהֵינוּ בּו לְטובָה. וּפָקְדֵנוּ בו לִבְרָכָה. וְהושִׁיעֵנוּ בו לְחַיִּים. וּבִדְבַר יְשׁוּעָה וְרַחֲמִים חוּס וְחָנֵּנוּ וְרַחֵם עָלֵינוּ וְהושִׁיעֵנוּ. כִּי אֵלֶיךָ עֵינֵינוּ. כִּי אֵל מֶלֶךְ חַנּוּן וְרַחוּם אָתָּה:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Container(),
        // TODO: Add cholhamoed pessah and succoth
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְתֶחֱזֶינָה עֵינֵינוּ בְּשׁוּבְךָ לְצִיּון בְּרַחֲמִים: בָּרוּךְ אַתָּה ה', הַמַּחֲזִיר שְׁכִינָתו לְצִיּון:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "מודִים אֲנַחְנוּ לָךְ. שָׁאַתָּה הוּא ה' אֱלהֵינוּ וֵאלהֵי אֲבותֵינוּ לְעולָם וָעֶד. צוּר חַיֵּינוּ. מָגֵן יִשְׁעֵנוּ אַתָּה הוּא לְדור וָדור: נודֶה לְּךָ וּנְסַפֵּר תְּהִלָּתֶךָ עַל חַיֵּינוּ הַמְּסוּרִים בְּיָדֶךָ. וְעַל נִשְׁמותֵינוּ הַפְּקוּדות לָךְ. וְעַל נִסֶּיךָ שֶׁבְּכָל יום עִמָּנוּ. וְעַל נִפְלְאותֶיךָ וְטובותֶיךָ שֶׁבְּכָל עֵת. עֶרֶב וָבקֶר וְצָהֳרָיִם: הַטּוב כִּי לא כָלוּ רַחֲמֶיךָ. וְהַמְרַחֵם כִּי לא תַמּוּ חֲסָדֶיךָ. מֵעולָם קִוִּינוּ לָךְ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Center(
                      child: Text(
                        "Modim D'Rabanan",
                      )),
                  children: [
                    Text(
                      "מודִים אֲנַחְנוּ לָךְ. שָׁאַתָּה הוּא ה' אֱלהֵינוּ וֵאלהֵי אֲבותֵינוּ. אֱלהֵי כָל בָּשר. יוצְרֵנוּ יוצֵר בְּרֵאשִׁית. בְּרָכות וְהודָאות לְשִׁמְךָ הַגָּדול וְהַקָּדושׁ. עַל שֶׁהֶחֱיִיתָנוּ וְקִיַּמְתָּנוּ. כֵּן תְּחַיֵּנוּ וּתְקַיְּמֵנוּ. וְתֶאֱסוף גָּלֻיּותֵינוּ לְחַצְרות קָדְשֶׁךָ. לִשְׁמור חֻקֶּיךָ. וְלַעֲשות רְצונֶךָ. וּלְעָבְדְךָ בְּלֵבָב שָׁלֵם. עַל שֶׁאָֽנוּ מודִים לָךְ. בָּרוּךְ  אַתָּה ה' אֵל הַהודָאוֹת:",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.suezOne(fontSize: 24),
                    ),
                  ],
                ),
              ),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isChanukah()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עַל הַנִּסִּים וְעַל הַפֻּרְקָן וְעַל הַגְּבוּרות וְעַל הַתְּשׁוּעות וְעַל הַמִּלְחָמות שֶׁעָשיתָ לַאֲבותֵינוּ בַּיָּמִים הָהֵם בִּזְּמַן הַזֶּה:\n בִּימֵי מַתִּתְיָהוּ בֶּן יוחָנָן כּהֵן גָּדול חַשְׁמונַאִי וּבָנָיו. כְּשֶׁעָמְדָה מַלְכוּת יָוָן הָרְשָׁעָה עַל עַמְּךָ יִשרָאֵל לְהַשְׁכִּיחָם תּורָתֶךָ וּלְהַעֲבִירָם מֵחֻקֵּי רְצונֶךָ: וְאַתָּה בְּרַחֲמֶיךָ הָרַבִּים עָמַדְתָּ לָהֶם בְּעֵת צָרָתָם. רַבְתָּ אֶת רִיבָם. דַנְתָּ אֶת דִּינָם. נָקַמְתָּ אֶת נִקְמָתָם. מָסַרְתָּ גִבּורִים בְּיַד חַלָּשִׁים. וְרַבִּים בְּיַד מְעַטִּים. וּטְמֵאִים בְּיַד טְהורִים. וּרְשָׁעִים בְּיַד צַדִּיקִים. וְזֵדִים בְּיַד עוסְקֵי תורָתֶךָ. וּלְךָ עָשיתָ שֵׁם גָּדול וְקָדושׁ בְּעולָמֶךָ. וּלְעַמְּךָ יִשרָאֵל עָשיתָ תְּשׁוּעָה גְדולָה וּפֻרְקָן כְּהַיּום הַזֶּה: וְאַחַר כֵּן בָּאוּ בָנֶיךָ לִדְבִיר בֵּיתֶךָ. וּפִנּוּ אֶת הֵיכָלֶךָ. וְטִהֲרוּ אֶת מִקְדָּשֶׁךָ. וְהִדְלִיקוּ נֵרות בְּחַצְרות קָדְשֶׁךָ. וְקָבְעוּ שְׁמונַת יְמֵי חֲנֻכָּה אֵלּוּ. לְהודות וּלְהַלֵּל לְשִׁמְךָ הַגָּדול:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Container(),
        JewishCalendar.fromDateTime(DateTime.now()).isPurim()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עַל הַנִּסִּים וְעַל הַפֻּרְקָן וְעַל הַגְּבוּרות וְעַל הַתְּשׁוּעות וְעַל הַמִּלְחָמות שֶׁעָשיתָ לַאֲבותֵינוּ בַּיָּמִים הָהֵם בִּזְּמַן הַזֶּה:\nבִּימֵי מָרְדְּכַי וְאֶסְתֵּר בְּשׁוּשַׁן הַבִּירָה. כְּשֶׁעָמַד עֲלֵיהֶם הָמָן הָרָשָׁע. בִּקֵּשׁ לְהַשְׁמִיד לַהֲרוג וּלְאַבֵּד אֶת כָּל הַיְּהוּדִים מִנַּעַר וְעַד זָקֵן טַף וְנָשִׁים בְּיום אֶחָד. בִּשְׁלשָׁה עָשר לְחדֶשׁ שְׁנֵים עָשר. הוּא חדֶשׁ אֲדָר. וּשְׁלָלָם לָבוז: וְאַתָּה בְּרַחֲמֶיךָ הָרַבִּים. הֵפַרְתָּ אֶת עֲצָתו. וְקִלְקַלְתָּ אֶת מַחֲשַׁבְתּו. וַהֲשֵׁבותָ לּו גְּמוּלו בְּראשׁו. וְתָלוּ אותו וְאֶת בָּנָיו עַל הָעֵץ.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Container(),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְעַל כֻּלָּם יִתְבָּרַךְ וְיִתְרומַם שִׁמְךָ מַלְכֵּנוּ תָּמִיד לְעולָם וָעֶד:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isTenDays()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וּכְתב לְחַיִּים טובִים כָּל בְּנֵי בְרִיתֶךָ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Container(),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "וְכל הַחַיִּים יודוּךָ סֶּלָה. וִיהַלְלוּ אֶת שִׁמְךָ בֶּאֱמֶת. הָאֵל יְשׁוּעָתֵנוּ וְעֶזְרָתֵנוּ סֶלָה. בָּרוּךְ אַתָּה ה', הַטּוב שִׁמְךָ וּלְךָ נָאֶה לְהודות:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "שָׁלוֹם רָב עַל יִשְׂרָאֵל עַמְּךָ תָּשִׂים לְעוֹלָם כִּי אַתָּה הוּא מֶלֶךְ אָדוֹן לְכָל הַשָּׁלוֹם וְטוֹב בְּעֵינֶיךָ לְבָרֵךְ אֶת עַמְּךָ יִשְׂרָאֵל בְּכָל עֵת וּבְכָל שָׁעָה בִּשְׁלוֹמֶךָ.",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        JewishCalendar.fromDateTime(DateTime.now()).isTenDays()
            ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בְּסֵפֶר חַיִּים. בְּרָכָה וְשָׁלום. וּפַרְנָסָה טובָה. נִזָּכֵר וְנִכָּתֵב לְפָנֶיךָ. אֲנַחְנוּ וְכָל עַמְּךָ בֵּית יִשרָאֵל. לְחַיִּים טובִים וּלְשָׁלום:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            ))
            : Container(),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "בָּרוּךְ אַתָּה ה', הַמְבָרֵךְ אֶת עַמּו יִשרָאֵל בַּשָּׁלום:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "אֱלהַי. נְצר לְשׁונִי מֵרָע וּשפָתַי מִדַּבֵּר מִרְמָה. וְלִמְקַלְלַי נַפְשִׁי תִדּם. וְנַפְשִׁי כֶּעָפָר לַכּל תִּהְיֶה. פְּתַח לִבִּי בְּתורָתֶךָ. וּבְמִצְותֶיךָ תִּרְדּף נַפְשִׁי. וְכָל הַחושְׁבִים עָלַי רָעָה. מְהֵרָה הָפֵר עֲצָתָם וְקַלְקֵל מַחֲשַׁבְתָּם: עֲשה לְמַעַן שְׁמֶךָ. עֲשה לְמַעַן יְמִינֶךָ. עֲשה לְמַעַן קְדֻשָּׁתֶךָ. עֲשה לְמַעַן תּורָתֶךָ. לְמַעַן יֵחָלְצוּן יְדִידֶיךָ הושִׁיעָה יְמִינְךָ וַעֲנֵנִי: יִהְיוּ לְרָצון אִמְרֵי פִי וְהֶגְיון לִבִּי לְפָנֶיךָ. ה' צוּרִי וְגואֲלִי: עשה שָׁלום בִּמְרומָיו. הוּא יַעֲשה שָׁלום עָלֵינוּ וְעַל כָּל יִשרָאֵל. וְאִמְרוּ אָמֵן:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "יְהִי רָצון מִלְּפָנֶיךָ ה' אֱלהֵינוּ וֵאלהֵי אֲבותֵינוּ. שֶׁיִּבָּנֶה בֵּית הַמִּקְדָּשׁ בִּמְהֵרָה בְיָמֵינוּ. וְתֵן חֶלְקֵנוּ בְּתורָתֶךָ:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
      ],
    ),
    // TODO: Motzei Shabbos

    // Aleinu
    Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עָלֵינוּ לְשַׁבֵּחַ לַאֲדון הַכּל. לָתֵת גְּדֻלָּה לְיוצֵר בְּרֵאשִׁית. שֶׁלּא עָשנוּ כְּגויֵי הָאֲרָצות. וְלא שמָנוּ כְּמִשְׁפְּחות הָאֲדָמָה. שֶׁלּא שם חֶלְקֵנוּ כָּהֶם וְגורָלֵנוּ כְּכָל הֲמונָם: שֶׁהֵם מִשְׁתַּחֲוִים לְהֶבֶל וְרִיק וּמִתְפַּלְלִים אֶל אֵל לא יושִׁיעַ: וַאֲנַחְנוּ כּורְעִים וּמִשְׁתַּחֲוִים וּמודִים לִפְנֵי מֶלֶךְ מַלְכֵי הַמְּלָכִים הַקָּדושׁ בָּרוּךְ הוּא: שֶׁהוּא נוטֶה שָׁמַיִם וְיוסֵד אָרֶץ, וְכִסֵּא כְבוֹדוֹ בַּשָּׁמַיִם מִמַּעַל. וּשְׁכִינַת עֻזּו בְּגָבְהֵי מְרומִים: הוּא אֱלהֵינוּ אֵין עוד. אֱמֶת מַלְכֵּנוּ. אֶפֶס זוּלָתו. כַּכָּתוּב בְּתורָתו. וְיָדַעְתָּ הַיּום וַהֲשֵׁבתָ אֶל לְבָבֶךָ. כִּי ה' הוּא הָאֱלהִים בַּשָּׁמַיִם מִמַּעַל וְעַל הָאָרֶץ מִתָּחַת. אֵין עוד:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "עַל כֵּן נְקַוֶּה לְּךָ ה' אֱלהֵינוּ לִרְאות מְהֵרָה בְּתִפְאֶרֶת עֻזֶּךָ. לְהַעֲבִיר גִּלּוּלִים מִן הָאָרֶץ. וְהָאֱלִילִים כָּרות יִכָּרֵתוּן. לְתַקֵּן עולָם בְּמַלְכוּת שַׁדַּי. וְכָל בְּנֵי בָשר יִקְרְאוּ בִשְׁמֶךָ לְהַפְנות אֵלֶיךָ כָּל רִשְׁעֵי אָרֶץ. יַכִּירוּ וְיֵדְעוּ כָּל יושְׁבֵי תֵבֵל. כִּי לְךָ תִּכְרַע כָּל בֶּרֶךְ. תִּשָּׁבַע כָּל לָשׁון. לְפָנֶיךָ ה' אֱלהֵינוּ יִכְרְעוּ וְיִפּלוּ. וְלִכְבוד שִׁמְךָ יְקָר יִתֵּנוּ. וִיקַבְּלוּ כֻלָּם אֶת על מַלְכוּתֶךָ. וְתִמְלךְ עֲלֵיהֶם מְהֵרָה לְעולָם וָעֶד. כִּי הַמַּלְכוּת שֶׁלְּךָ הִיא וּלְעולְמֵי עַד תִּמְלךְ בְּכָבוד. כַּכָּתוּב בְּתורָתֶךָ. ה' יִמְלךְ לְעולָם וָעֶד:",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.suezOne(fontSize: 24),
            )),
      ],
    ),
    // TODO: Omer
  ];

  List<DropdownMenuItem<int>> dropDownMenuItems = [
    DropdownMenuItem(
      value: 0,
      child: Text(
        "Shema",
//                  style: TextStyle(color: Theme.of(context).accentColor),
      ),
    ),
    DropdownMenuItem(
      value: 1,
      child: Text(
        "Shmonei Esrei",
//                  style: TextStyle(color: Theme.of(context).accentColor),
      ),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text(
        "Aleinu",
//                  style: TextStyle(color: Theme.of(context).accentColor),
      ),
    ),
  ];

  int _value = 0;

  @override
  void initState() {
    super.initState();
    itemScrollController = ItemScrollController();

  }

//   TODO: Implement autoscoll
  void autoScroll(){
//        itemScrollController.scrollTo(index:_scrollIndex+1,
//            duration: Duration(seconds: 30),
//            alignment: 0,
//            curve: Curves.linear);
  }

  setDropDownMenuItem(int index){

      setState(() {
        _value = index;
      });
  }

  @override
  Widget build(BuildContext context) {

    itemPositionsListener.itemPositions.addListener(() {
      if (itemPositionsListener.itemPositions.value.isNotEmpty) {
        int currentIndex = itemPositionsListener.itemPositions.value
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .reduce((ItemPosition min, ItemPosition position) =>
        position.itemTrailingEdge < min.itemTrailingEdge
            ? position
            : min)
            .index;
//        int currentIndex =
//            itemPositionsListener.itemPositions.value.elementAt(0).index;
        if (currentIndex < 3 && currentIndex > -1) {
          setDropDownMenuItem(currentIndex);
        }
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => CustomDrawer.of(context).open(),
            );
          },
        ),
        title: new DropdownButton(
          underline: Container(),
          items: dropDownMenuItems,
          onChanged: (value) {
            itemScrollController.jumpTo(index: value);
            setState(() {
              _value = value;
            });
          },
          value: _value,
        ),
      ),
      body: GestureDetector(
        onDoubleTap: () {
          autoScroll();
        },
        onScaleStart: (details) {
          _baseScaleFactor = _scaleFactor;
        },
        onScaleUpdate: (details) {
          print(details.scale);
          setState(() {
            _scaleFactor = _baseScaleFactor * details.scale;
          });
        },
        child: Center(
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.vertical,
              itemCount: nightPrayers.length,
              itemBuilder: (context, index) => nightPrayers[index],
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
