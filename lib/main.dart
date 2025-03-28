// Main entry point for the Qremo app
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

part 'colors.dart';
part 'profile.dart';
part 'notes.dart';
part 'quiz.dart';
part 'home.dart';
part 'subject.dart';
String url = '';
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

      theme: ThemeData(colorScheme: ColorScheme(brightness:Brightness.dark,primary: crust,onPrimary: mauve, secondary:mantle ,onSecondary: lavender,surface: crust,onSurface: text,error:red,onError: text)),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
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
        unselectedItemColor: rosewater,
        selectedItemColor: pink,
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
class RecommendedTopicCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const RecommendedTopicCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle tap to show more details
          print('Tapped on $title');
        },
        child: SizedBox(
          width: 250.0, // Adjust width as necessary
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

