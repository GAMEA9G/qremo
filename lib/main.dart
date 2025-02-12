// Main entry point for the Qremo app
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

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

      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Use system theme (light or dark)
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
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
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

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Maths": 4,
      "Biology": 4.5,
      "Physics": 5.5,
      "Chemistry": 6
    };

    final colorList = <Color>[
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.orangeAccent
    ];
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).cardColor,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Use full screen width
                  height: MediaQuery.of(context).size.width *
                      0.40, // Set height relative to width

                  decoration: BoxDecoration(
                      color: Color.fromRGBO(111, 56, 242, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                // Circle size
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid",
                                    scale: 1
                                    // Correct URL
                                    ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 0, top: 20),
                          child: Column(
                            children: [
                              Text(
                                "User Name",
                                style: TextStyle(
                                    color: Color.fromRGBO(2, 255, 31, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Sylabuss: SSLC",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                ),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  label: const Text('Edit details'),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color.fromRGBO(24, 19, 84, 1)),
                                ),
                              )
                            ],
                          )),
                    ]),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Material(
                child: Stack(
                  children: [
                    // Container with the background and content
                    Material(
                      color: Colors
                          .transparent, // Make sure the Material widget is transparent
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(30, 30, 46, 1),
                        ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: 400,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Statistics",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(242, 149, 56, 1)),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                baseChartColor:
                                    Colors.grey[50]!.withOpacity(0.15),
                                colorList: colorList,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                ),
                                totalValue: 100,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // InkWell on top of the container
                    Positioned.fill(
                      child: InkWell(
                        hoverColor: Color.fromRGBO(112, 56, 242, 0),
                        splashColor: Theme.of(context).cardColor,
                        onTap: () {
                          Navigator.pop(context, QuizPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}

// Announcements Page
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  //Example list, adjust as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Notes",
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: subjectsList.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: SvgPicture.asset(
                'asset/${subjectsList[i]}.svg',
                width: 40,
                height: 40,
              ),
              title: Text(subjectsList[i]),
            );
          },
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                  Radius.circular(20)), // Rounded corners
            ),
            child: SingleChildScrollView(
                child: Column(children: [
              AppBar(
                title: Text("Quiz page"),
              ),
              TextFormField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Search Topic',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)), // Rounded corners
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Border when the field is focused
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)), // Rounded corners
                    borderSide: BorderSide(
                        color: Colors.green,
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
                        top: BorderSide(
                            color: Colors.green,
                            width: 2,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Colors.green,
                            width: 2,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Colors.green,
                            width: 2,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                          color: Colors.green,
                          width: 2,
                          style: BorderStyle.solid,
                        )),
                    borderRadius: BorderRadius.circular(20)),
              )
            ]))));
  }
}

// Notes Page
class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Recommented",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              // Removed SizedBox for extra space here
              // Horizontal Scroll View with recommended topics
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: RecommendedTopicCard(
                        title: 'Subject ${index + 1}',
                        description: 'Description of Subject ${index + 1}',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    );
                  }),
                ),
              ),
              // Adding a SizedBox to ensure there's space between elements

              SizedBox(height: 10.0),
              Text(
                "Subjects",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 15.0,
                children: [
                  for (var i = 0; i < subjectsList.length; i++)

                    // Only include subjects for i <= 3
                    GestureDetector(
                      onTap: () {
                        print("clicked Subject ${subjectsList[i]}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubjectMenu(
                                    nameOfSubject: subjectsList[i],
                                    searchButton: false,
                                  )),
                        ); // Change subject number based on the loop
                      },
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                height:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.shade700,
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  'asset/${subjectsList[i]}.svg', // Make sure the path is correct
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                subjectsList[i],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              )
                            ],
                          )),
                    )
                ],
              ),
              SizedBox(height: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectMenu extends StatefulWidget {
  final String nameOfSubject;
  bool searchButton;

  SubjectMenu(
      {super.key, required this.nameOfSubject, required this.searchButton});

  @override
  _SubjectMenuState createState() => _SubjectMenuState();
}

class _SubjectMenuState extends State<SubjectMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.nameOfSubject),
            actions: [
              IconButton(
                icon: Icon(Icons.search_rounded),
                onPressed: () {
                  setState(() {
                    widget.searchButton = !widget.searchButton;
                  });
                },
              ),
            ],
          ),
          body: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                widget.searchButton
                    ? TextFormField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Search ${widget.nameOfSubject}',
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(top: 5),
                        width: 360,
                        height: 175,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Wrap(
                          runSpacing: 10,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 125,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Topic Name",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 35, left: 10),
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                                )
                              ],
                            )
                          ],
                        )),
              ]),
            ),
          ),
        ));
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

// Practice Page
class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 15, right: 15),
        // Adds margin around the container
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Background color from the theme
          borderRadius:
              const BorderRadius.all(Radius.circular(20)), // Rounded corners
        ),
        child: SingleChildScrollView(
            child: Column(children: [
          TextFormField(
            cursorColor: Colors.green, // Custom cursor color
            decoration: InputDecoration(
              labelText: 'Search Topic', // Label for the input field
              border: OutlineInputBorder(
                // Adding border to the TextFormField
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                // Rounded corners for the border
                borderSide: BorderSide(
                    color: Colors.green, width: 2), // Border color and width
              ),
              enabledBorder: OutlineInputBorder(
                // Border when the field is enabled
                borderRadius: const BorderRadius.all(
                    Radius.circular(20)), // Rounded corners
                borderSide: BorderSide(
                    color: Colors.green, width: 2), // Border color and width
              ),
              focusedBorder: OutlineInputBorder(
                // Border when the field is focused
                borderRadius: const BorderRadius.all(
                    Radius.circular(20)), // Rounded corners
                borderSide: BorderSide(
                    color: Colors.green, width: 2), // Border color and width
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
                    top: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                      color: Colors.green,
                      width: 2,
                      style: BorderStyle.solid,
                    )),
                borderRadius: BorderRadius.circular(20)),
          ),
        ])));
  }
}
