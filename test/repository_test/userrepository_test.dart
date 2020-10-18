import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:touchins/repository/user_repository.dart';
import 'package:touchins/view_models/user.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  test('user repository registeruser', () async {

    UserRepository userRepository = new UserRepository();

    User user = new User();
    user.fullName = 'kalidas';
    user.email = 'kalidas@mail.com';
    user.country = 'India';
    user.city = 'chennai';
    user.street = '2 cross street';

    await userRepository.registerUser(user);

    var actual = await userRepository.getUserById(any);

    expect(actual.fullName, user.fullName);
    expect(actual.email, user.email);
    expect(actual.country, user.country);
    expect(actual.city, user.city);
    expect(actual.street, user.street);
  });
}
