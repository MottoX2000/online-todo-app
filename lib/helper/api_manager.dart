import 'dart:convert';
import "package:http/http.dart" as http;

class ApiManager {
  final String _baseURL =
      "https://crudcrud.com/api/17836e6590ef4bc7a772e16a83223675";

  get(String url) async {
    try {
      var response = await http.get(Uri.parse(_baseURL + url));

      if (response.statusCode == 200) {
        var resposeJson = json.decode(response.body.toString());
        return resposeJson;
      }
    } catch (e) {
      rethrow;
    }
  }

  post(String url, Map<String, dynamic> data) async {
    try {
      String jsondata = json.encode(data);
      final response = await http.post(Uri.parse(_baseURL + url),
          body: jsondata,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          });

      if (response.statusCode == 201 || response.statusCode == 200) {
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      } else {
        print("Post error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  put(String url, Map<String, dynamic> data) async {
    try {
      String jsondata = json.encode(data);
      final response = await http.put(Uri.parse(_baseURL + url),
          body: jsondata,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          });

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
        return true;
      } else {
        print("Put error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Put exception: $e");
      rethrow;
    }
  }

  delete(String url) async {
    try {
      var response = await http.delete(Uri.parse(_baseURL + url));

      if (response.statusCode == 200 || response.statusCode == 204) {
        // Some APIs return 204 No Content for successful deletes
        if (response.body.isNotEmpty) {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
        return true; // Return something non-null for empty responses
      } else {
        print("Delete failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
