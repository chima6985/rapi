import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://reqres.in/api";
Future<void> fetchUser() async{
  http.get(Uri.parse('$baseUrl'));
}

}