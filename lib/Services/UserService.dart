import 'package:qstl_test/Models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<List<User>> fetchAllUsers() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));

      http.StreamedResponse streamedResponse = await request.send();

      http.Response response = await http.Response.fromStream(streamedResponse);

      return userFromJson(response.body);
    } catch (e) {
      return <User>[];
    }
  }
}
