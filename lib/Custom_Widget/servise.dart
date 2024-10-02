import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://api.zaheen.com.pk/api/fetchByTableName/2/1";

  // Function to fetch data from the API
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a successful response, decode the JSON
      return json.decode(response.body);
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to load data');
    }
  }
}
