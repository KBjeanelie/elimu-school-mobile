import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'http://192.168.1.75:8000/api';

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> fetchData(String endpoint) async {
    try {
      final response = await _dio.get('$baseUrl/$endpoint');
      return response.data;
    } catch (error) {
      throw Exception('Erreur lors de la récupération des données : $error');
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$baseUrl/$endpoint', data: data);
      return response.data;
    } catch (error) {
      throw Exception('Erreur lors de l\'envoi des données : $error');
    }
  }
}


class AuthService {
  final Dio _dio = Dio();

  Future<void> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login/',
        data: {'username': username, 'password': password},
      );

      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];

      // Stocker les jetons localement
      await _saveTokens(accessToken, refreshToken);
    } catch (error) {
      throw Exception('Erreur lors de la connexion : $error');
    }
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<Map<String, String?>> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    final refreshToken = prefs.getString('refresh_token');
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}