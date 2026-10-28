part of 'main.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNew();
}

class _HomePageNew extends State<HomePageNew> {
  Future<String?>? userName;
  Future<String?> getUserName() async {
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
            decoration: BoxDecoration(
              color: isDarktheme ? baseDark : baseLight,
            ),
            child: Container(
                alignment: Alignment.topLeft,
                
            margin: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: userName,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            }
                            if (snapshot.hasData) {
                              return Builder(builder: (context) {
                                final random = Random();
                                final greetingMorningMsg =
                                    GreetingMessage().morning[random.nextInt(
                                        GreetingMessage().morning.length - 1)];
                                final greetingEveningMsg =
                                    GreetingMessage().evening[random.nextInt(
                                        GreetingMessage().evening.length - 1)];

                                if (DateTime.now().hour < 12) {
                                  return Builder(builder: (context) {
                                    if (greetingMorningMsg == "Good Morning,") {
                                      return Padding(
                                          padding: EdgeInsetsGeometry.all(20),
                                          child: Text(greetingMorningMsg,
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: isDarktheme
                                                      ? textDark
                                                      : textLight)));
                                    } else {
                                      return Row(children: [
                                        Text(
                                            '$greetingMorningMsg , ${snapshot.data} ',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: isDarktheme
                                                    ? textDark
                                                    : textLight)),
                                      ]);
                                    }
                                  });
                                } else {
                                  return Builder(builder: (context) {
                                    if (greetingEveningMsg == "Good Evening,") {
                                      return Padding(
                                          padding: EdgeInsetsGeometry.all(50),
                                          child: Text(greetingEveningMsg,
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: isDarktheme
                                                      ? textDark
                                                      : textLight)));
                                    } else {
                                      return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsetsGeometry.all(7),
                                                child: Text(
                                                    "${greetingEveningMsg} , ${snapshot.data}",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: isDarktheme
                                                            ? textDark
                                                            : textLight)))
                                          ]);
                                    }
                                  });
                                }
                              });
                            }
                            return Center(
                                child: Text(snapshot.error.toString()));
                          },
                        ),
                        Text(
                          "Continue Learning",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        horizontalCardList(isDarktheme: isDarktheme),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Suggested for you",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        horizontalCardList(isDarktheme: isDarktheme),
                      ]),
                ))));
  }
}
