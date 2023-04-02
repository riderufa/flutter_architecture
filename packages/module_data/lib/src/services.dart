import 'package:module_model/module_model.dart';

abstract class HealthService {
  bool getHealth();
}

abstract class UserService {
  Future<User> getDefaultUser();
  Future<User> getUserById(int id);
}
