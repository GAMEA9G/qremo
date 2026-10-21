part of 'main.dart';

Future<String?> getUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('UserId');
}

class appWalkthrough_01 extends StatelessWidget {
  const appWalkthrough_01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.10,
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const appWalkthrough_02()),
              (route) => false,
            );
          },
          child: Text("Next"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: MarkdownLatex(
            data: About().readme,
            maxWidth: 720,
          ),
        ));
  }
}

class appWalkthrough_02 extends StatefulWidget {
  const appWalkthrough_02({super.key});

  @override
  State<appWalkthrough_02> createState() => _appWalkthrough_02State();
}

class _appWalkthrough_02State extends State<appWalkthrough_02> {
  final TextEditingController usernameController = TextEditingController();
  Future<String?>? userName;

  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('UserName');
  }
Future init() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}
  @override
  void initState() {
    super.initState();

    userName = getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userName,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData && usernameController.text.isEmpty) {
            usernameController.text = snapshot.data!;
          }
          return Scaffold(
              appBar: AppBar(
                elevation: 0.10,
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
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const appWalkthrough_03()),
                    (route) => false,
                  );
                },
                child: Text("Next"),
              ),
              body: Column(
                children: [
                  ThemedBox(
                      margin: EdgeInsetsGeometry.all(10),
                      height: 45,
                      child: Padding(
                          padding: EdgeInsetsGeometry.only(
                              right: 15, left: 15, bottom: 10, top: 15),
                          child:
                              TextFormField(controller: usernameController))),
                  TextButton(
                      onPressed: () async {

                        final userId = await getUserId();
                        final newName = usernameController.text.trim();
                        changeUsername(userId, newName);
                      },
                      child: Text("Change Username"))
                ],
              ));
        });
  }
}

class appWalkthrough_03 extends StatefulWidget {
  const appWalkthrough_03({super.key});

  @override
  State<appWalkthrough_03> createState() => _appWalkthrough_03State();
}

class _appWalkthrough_03State extends State<appWalkthrough_03> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.10,
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
        ),
        body: FutureBuilder(
            future: getSylabuss(),
            builder: (BuildContext, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              print("Sylabusses: ${snapshot.data.toString()}");
              final Map body = snapshot.data!.data;
              final List<SyllabusPost> Sylabusses = (body['syllabus'] as List)
                  .map((e) => SyllabusPost.fromJson(e as Map<String, dynamic>))
                  .toList();

              return ListView.builder(
                  itemCount: Sylabusses.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                        onTap: () async {
                          final userId = await getUserId();

                          if (userId == null) {
                            print("User ID is null");
                            return;
                          }
                          await setUserSyllabus(
                              userId, Sylabusses[index].id?.toInt());
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false,
                          );
                        },
                        child: ThemedBox(
                            height: 50,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsetsGeometry.all(5),
                                  child: Text(
                                    Sylabusses[index].name.toString(),
                                  ),
                                ))));
                  });
            }));
  }
}
