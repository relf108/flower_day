import 'dart:convert';

import 'package:http/http.dart' as http;

class NotificationsAPI {
  static Future<List<Map<String, String>>> getNotifications() async {
    // Fetch notifications from the server
    final response =
        await http.get(Uri.http('localhost:8000', '/notifications'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // parse the JSON
      final List<dynamic> notifications = json.decode(response.body);
      return notifications
          .map((notification) => Map<String, String>.from(notification))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load notifications');
    }
  }
}
