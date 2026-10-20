part of 'main.dart';
class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final Future<bool> newUser;
  Future<bool> isNewUser() async{
    return true;//TODO:Check if the user has already an account to show the popup to change username and select syllabuss
  } 

  @override
  void initState() {
    super.initState();
    newUser = isNewUser();
  }
      Future<void> loginToHompage() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool success = await Authenticate().signIn();
      if (success != false) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) =>  HomePage()),
          (route) => false,
        );
      }
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage("asset/blob-scene-haikei.png"),
                fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: (MediaQuery.of(context).size.height * 3 / 4),
                  ),
                  child: TextButton(
                      onPressed: loginToHompage,
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? surface1Dark
                                  : surface1Light,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          elevation: 10),
                      child: const Text("Sign In",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ))))
            ],
          )),
    );
  }
}


