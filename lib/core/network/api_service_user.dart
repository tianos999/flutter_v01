import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snack_cart/data/models/user_model.dart';

Future<User> fetchUserData() async {
  final url = Uri.parse('https://gato3333-6h2az.bunny.run/');

  // Make the network request
  final response = await http.get(url);

  // Check if the server returned a 200 OK status code
  if (response.statusCode == 200) {
    // Parse the raw JSON string into a Dart Map
    final Map<String, dynamic> jsonMap = jsonDecode(response.body);

    // Map the JSON data into your object structure
    return User.fromJson(jsonMap);
  } else {
    // Gracefully handle server failure
    throw Exception('GATO --- Failed to load user data: Status Code ${response.statusCode}');
  }
}
