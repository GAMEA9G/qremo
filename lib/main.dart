import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qremo/post.dart';
import 'package:qremo/variables.dart';
import "dart:math";
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter_http_input/image_size_getter_http_input.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:markdown_latex/markdown_latex.dart';
import 'dart:ui';
import 'dart:convert';
part 'login.dart';
part 'colors.dart';
part 'profile.dart';
part 'notes.dart';
part 'quiz.dart';
part 'home.dart';
part 'subject.dart';
part 'Start_practice.dart';
part 'practice.dart';
part 'edit.dart';
part 'custom-wigets.dart';
part 'notemenu.dart';
part 'html.dart';
part 'auth.dart';
part 'intialSetup.dart';

late final PersistCookieJar cookieJar;
final dio = Dio();
Future<void> cookies() async {
  final appDirectory = await getApplicationDocumentsDirectory();

  cookieJar = PersistCookieJar(
    ignoreExpires: false,
    storage: FileStorage('${appDirectory.path}/cookies'),
  );

  dio.interceptors.add(
    CookieManager(cookieJar),
  );
  final saved_cookie =
      await cookieJar.loadForRequest(Uri.parse(About().apiUri));
  print("saved cookie $saved_cookie");
}

List<String> subjectsList = [
  "Maths",
  "Biology",
  "Physics",
  "Chemistry",
  "Geography",
  "English",
  "History"
];
void main() => runApp(QremoApp());

class QremoApp extends StatelessWidget {
  const QremoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qremo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool?>? haslogined;
  Future<bool?>? hasLogined() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasLogined') ?? false;
  }

  @override
  void initState() {
    super.initState();
    haslogined = hasLogined();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: haslogined,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasError && snapshot.hasData) {
            if (snapshot.data == true) {
              return appWalkthrough_01();
            } else {
              return LoginPage();
            }
          }
          return Text("An Error Occured");
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePageNew(),
    const NotesPage(),
    const Profile()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.35,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        shadowColor: Theme.of(context).brightness == Brightness.dark
            ? mauveDark
            : mauveLight,
        title: const Text(
          'Qremo',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? rosewaterDark
            : rosewaterLight,
        selectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? pinkDark
            : pinkLight,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("working"),
    );
  }
}
