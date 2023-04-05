import 'package:module_data/src/models/user/user.dart';

abstract class HealthService {
  bool getHealth();
}

abstract class UserService {
  Future<User> getDefaultUser();
  Future<User> getUserById(int id);
}
