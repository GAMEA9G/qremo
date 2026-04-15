part of 'main.dart';

class Authenticate {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  Future<bool> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String serverClientId =
        '269554392322-alr7tg5rhr12pn5rikd8mv6osrdphorf.apps.googleusercontent.com';

    await googleSignIn.initialize(serverClientId: serverClientId);
    GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
    if (googleUser == null) {
      // User canceled the sign-in
      return false;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final String? idToken = googleAuth.idToken;
    Future<dynamic> sendToken(String? idToken) async {
      try {
        Dio dio = Dio();
        Response response = await dio.post(
            "https://qremo-backend.vercel.app/api/auth",
            data: {},
            options: Options(headers: {"Authorization": "Bearer $idToken"}));
        print("Sending token: $idToken");
        return response;
      } on DioError catch (e) {
        print("Dio error: ${e.message}");
        print("Status: ${e.response?.statusCode}");
        print("Data: ${e.response?.data}");
        return null;
      }
    }

    final response = await sendToken(idToken);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data;

      await prefs.setString('UserName', body["newUser"]["name"]);
      await prefs.setString('UserEmail', body["newUser"]["email"]);

      Future.delayed(Duration(milliseconds: 500));
      return true;
    } else {
      return true;
    }
  }

  Future<void> userInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('UserEmail', 'alex@gmail.com');
  }
}// Send the ID token to your backend


      
      


           


