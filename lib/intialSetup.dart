part of 'main.dart';

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
  Future<String?>? userName;
  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('UserName');
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
                          child: TextFormField(initialValue: snapshot.data)))
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

  Future<dynamic> getSylabuss() async {
    try {
      await cookies();
      Response response = await dio.get(
        "${About().apiUri}/Syllabus",
      );

      return response;
    } on DioError catch (e) {
      print("Dio error: ${e.message}");
      print("Status: ${e.response?.statusCode}");
      print("Data: ${e.response?.data}");
      return null;
    }
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
            final List body = snapshot.data!.data as List;
            final List<SyllabusPost> Sylabusses =
                body.map((e) => SyllabusPost.fromJson(e)).toList();
            return ListView.builder(
                itemCount: Sylabusses.length,
                itemBuilder: (context, int index) {
                  return ThemedBox(
                    height: 40,
                    child: Align(alignment: Alignment.centerLeft,child :Padding(padding: EdgeInsetsGeometry.all(5),child: Text(Sylabusses[index].name.toString(),),))
                  );
                });
          },
        ));
  }
}
