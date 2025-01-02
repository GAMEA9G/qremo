// Main entry point for the Qremo app
import 'package:flutter/material.dart';

void main() => runApp(QremoApp());

class QremoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qremo',
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Use system theme (light or dark)
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AnnouncementsPage(),
    const QuizPage(),
    const NotesPage(),
    const PracticePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qremo'),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Practice',
          ),
        ],
      ),
    );
  }
}

// Announcements Page
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Announcements Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

// Quiz Page
class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 15, right: 15),
        // Adds margin around the container
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor, // Background color from the theme
          borderRadius: const BorderRadius.all(
              Radius.circular(20)), // Rounded corners

        ),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.blue, // Custom cursor color
                    decoration: InputDecoration(
                      labelText: 'Search Topic', // Label for the input field
                      border: OutlineInputBorder( // Adding border to the TextFormField
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)),
                        // Rounded corners for the border
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      enabledBorder: OutlineInputBorder( // Border when the field is enabled
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      focusedBorder: OutlineInputBorder( // Border when the field is focused
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                    ),
                  ),
                  Container(

                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 30),
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            bottom: BorderSide(color: Colors.blue,
                              width: 2,
                              style: BorderStyle.solid,)

                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ]
            )
        )
    );
  }


}


// Notes Page
class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 15, right: 15),
        // Adds margin around the container
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor, // Background color from the theme
          borderRadius: const BorderRadius.all(
              Radius.circular(20)), // Rounded corners

        ),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.blue, // Custom cursor color
                    decoration: InputDecoration(
                      labelText: 'Search Chapter', // Label for the input field
                      border: OutlineInputBorder( // Adding border to the TextFormField
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)),
                        // Rounded corners for the border
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      enabledBorder: OutlineInputBorder( // Border when the field is enabled
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      focusedBorder: OutlineInputBorder( // Border when the field is focused
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                    ),
                  ),
                  Container(

                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 30),
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            bottom: BorderSide(color: Colors.blue,
                              width: 2,
                              style: BorderStyle.solid,)

                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ]
            )
        )
    );
  }
}

// Practice Page
class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 15, right: 15),
        // Adds margin around the container
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor, // Background color from the theme
          borderRadius: const BorderRadius.all(
              Radius.circular(20)), // Rounded corners

        ),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.blue, // Custom cursor color
                    decoration: InputDecoration(
                      labelText: 'Search Topic', // Label for the input field
                      border: OutlineInputBorder( // Adding border to the TextFormField
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)),
                        // Rounded corners for the border
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      enabledBorder: OutlineInputBorder( // Border when the field is enabled
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                      focusedBorder: OutlineInputBorder( // Border when the field is focused
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)), // Rounded corners
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2), // Border color and width
                      ),
                    ),
                  ),
                  Container(

                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 30),
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            left: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            right: BorderSide(color: Colors.blue,
                                width: 2,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                              color: Colors.blue,
                              width: 2,
                              style: BorderStyle.solid,)

                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ]
            )
        )
    );
  }
}