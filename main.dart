import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchins/repository/auth_repository.dart';
import 'package:touchins/repository/user_repository.dart';
import 'package:touchins/screens/pages/Home/home_page.dart';
import 'package:touchins/screens/pages/Intro/IntroPage.dart';
import 'package:touchins/services/registration_service.dart';
import 'services/authentication_service.dart';

List<SingleChildCloneableWidget> providers = [
  Provider.value(value: AuthRepository()),
  Provider.value(value: UserRepository()),
  ProxyProvider<UserRepository, AuthenticationService>(
    // ignore: deprecated_member_use
    builder: (context, userRepo, authenticationService) =>
        AuthenticationService(userRepository: userRepo),
  ),
  ProxyProvider<UserRepository, RegistrationService>(
    // ignore: deprecated_member_use
    builder: (context, api, authenticationService) =>
        RegistrationService(userRepository: api),
  )
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: 'welcome',
        routes: {'welcome': (context) => IntroPage()},
        title: 'Touchin app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
