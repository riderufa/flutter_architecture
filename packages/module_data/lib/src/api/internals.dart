import 'package:module_data/src/models/user/user.dart';

import '../services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HealthService)
class DummyService implements HealthService {
  @override
  bool getHealth() {
    return true;
  }
}

@LazySingleton(as: UserService)
class DummyUserService implements UserService {
  @override
  Future<User> getDefaultUser() async {
    await Future.delayed(
      const Duration(seconds: 2)
    );
    return const User(id: 1, name: 'Garry');
  }

  @override
  Future<User> getUserById(int id) async {
    await Future.delayed(
      const Duration(seconds: 2)
    );
    return User(id: id, name: 'User with id: $id');
  }
}
