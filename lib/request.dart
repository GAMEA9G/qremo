part of 'main.dart';

Future<dynamic> getSylabuss() async {
  try {
    if (!cookieJarInitialized) {
      await cookies();
      cookieJarInitialized = true;
    }

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

Future<dynamic> setUserSyllabus(id, SylabussId) async {
  try {
    if (!cookieJarInitialized) {
      await cookies();
      cookieJarInitialized = true;
    }

    Response response = await dio.post("${About().apiUri}/user",
        data: {"userId": id, "SyllabusId": SylabussId});
    print("Function Called");

    return response;
  } on DioException catch (e) {
    print("Dio error: ${e.error}");
    print("Status: ${e.response?.statusCode}");
    print("Data: ${e.response?.data}");
    return null;
  }
}

Future<dynamic> changeUsername(id, newName) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!cookieJarInitialized) {
      await cookies();
    }
    Response response = await dio
        .patch("${About().apiUri}/user", data: {"id": id, "newName": newName});
    print("Function Called");

    await prefs.setString('UserName', newName);
    return response;
  } on DioException catch (e) {
    print("Dio error: ${e.error}");
    print("Status: ${e.response?.statusCode}");
    print("Data: ${e.response?.data}");
    return null;
  }
}
