import 'package:github_application/constants/api_path.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<http.Response> fetchUser(String username) async {
    return http.get(Uri.parse(BASE_URL + "users/" + username));
  }
  
}