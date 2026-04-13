import 'package:shared_preferences/shared_preferences.dart';

Future<void> userInfo() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('UserName','Alex');
  await prefs.setString('UserEmail','alex@gmail.com');
  await prefs.setBool('isNewUser',true);
  await prefs.setString('Token','');
}
class GreetingMessage {
  final morning = ["Good Morning,","Konnichiwa","Ni hao","Annyeong","Namasthe"];
  final evening = ["Good Evening","konbanwa","Boa noite","Buenas noches"];}


