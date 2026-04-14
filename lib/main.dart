import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'dart:io';
import 'dart:ui';
import 'variables.dart';
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
    Future<String?>? token;

    @override
      void initState() {

        super.initState();
        token =getToken();
        }
    @override
    Widget build(BuildContext context) {
      return FutureBuilder(future: getToken(), builder: (context,snapshot){
      if (snapshot.connectionState ==ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      if (!snapshot.hasError && snapshot.hasData){
        if (snapshot.data!=''){
          return HomePage();
        }
        else{
          return LoginPage();
        }
      }
      return Text("An Error Occured");
      }
      );

    }
  }
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();  }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qremo'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.task),
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
        unselectedItemColor: Theme.of(context).brightness== Brightness.dark ? rosewaterDark :rosewaterLight,
        selectedItemColor:  Theme.of(context).brightness== Brightness.dark ? pinkDark : pinkLight,
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
