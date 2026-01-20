import 'dart:convert';

import 'package:http/http.dart' as http;

class InstrestRepository {
  saveInstrest({required List<String> selectedInstrest}) async {
    final Uri url = Uri.parse("uri");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer YOUR-TOKEN",
        },
        body: jsonEncode({"instrests": selectedInstrest}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {}
  }
}
