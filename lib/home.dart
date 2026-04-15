part of 'main.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNew();
}

class _HomePageNew extends State<HomePageNew> {
  Future<String?>? userName;
  Future<String?> getUserName() async {
    await Authenticate().userInfo();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('UserName');
  }

  Future<String?> getToken() async {
    await Authenticate().userInfo();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Token');
  }

  Future<String?> getUserEmail() async {
    await Authenticate().userInfo();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('UserEmail');
  }

  Future<String?> isNewUser() async {
    await Authenticate().userInfo();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('isNewUser');
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      userName = getUserName();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarktheme =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
        body: Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      final random = Random();
                      final greetingMorningMsg = GreetingMessage().morning[
                          random.nextInt(GreetingMessage().morning.length - 1)];
                      final greetingEveningMsg = GreetingMessage().evening[
                          random.nextInt(GreetingMessage().evening.length - 1)];

                      if (DateTime.now().hour < 12) {
                        return Builder(builder: (context) {
                          if (greetingMorningMsg == "Good Morning,") {
                            return Text(greetingMorningMsg,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: isDarktheme ? textDark : textLight));
                          } else {
                            return Row(children: [
                              Text(greetingMorningMsg,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color:
                                          isDarktheme ? textDark : textLight)),
                              Text("- Good Morning",
                                  style: TextStyle(fontSize: 10))
                            ]);
                          }
                        });
                      } else {
                        return Builder(builder: (context) {
                          if (greetingEveningMsg == "Good Evening,") {
                            return Text(greetingEveningMsg,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: isDarktheme ? textDark : textLight));
                          } else {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(greetingEveningMsg,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: isDarktheme
                                              ? textDark
                                              : textLight)),
                                  Text(
                                    "- Good Evening",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ]);
                          }
                        });
                      }
                    }),
                    FutureBuilder(
                      future: userName,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        if (snapshot.hasData) {
                          return Text(snapshot.data!,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: isDarktheme ? textDark : textLight));
                        }
                        return Center(child: Text(snapshot.error.toString()));
                      },
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: []),
                    ),

                    // Adding a SizedBox to ensure there's space between elements

                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 15.0,
                      children: [
                        // Only include subjects for i <= 3
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: subjectsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 0,
                          ),
                          itemBuilder: (context, i) {
                            return GestureDetector(
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
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? mauveDark
                                                      : mauveLight,
                                                  blurRadius: 8.5,
                                                ),
                                              ],
                                            ),
                                            child: SvgPicture.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'asset/${subjectsList[i]}.svg'
                                                  : 'asset/${subjectsList[i]}_light.svg',
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                    Text(
                                      subjectsList[i],
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ));
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 18.0)
                  ]),
            )));
  }
}
