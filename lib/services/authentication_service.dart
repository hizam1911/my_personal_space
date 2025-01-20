import 'package:hive/hive.dart';

class AuthenticationService {
  Future<bool> login(String username, String password) async {
    try {
      final adminBox = await Hive.openBox<Map>('admin');
      final credentials = adminBox.get('credentials');

      // Check if credentials exist and match the provided username and password
      if (credentials != null &&
          credentials['username'] == username &&
          credentials['password'] == password) {
        print("Login successful");
        return true;
      } else {
        print("Invalid username or password");
        return false;
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }


}