import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTokenRepo {
  final Dio dio;

  GetTokenRepo({required this.dio});

  Future getToken({
    required String login,
    required String password,
  }) async {
    final result = await dio.post('auth/login', data: {
      'login': login,
      "password": password,
    });

    return result.data;
  }

  Future getList() async {
    final prefs = await SharedPreferences.getInstance();
    final result = dio.get(
      'registrator/menu/menuSidebar',
      options: Options(
        headers: {
          'Authorization': prefs.getString('token'),
        },
      ),
    );
    return result;
  }
}
