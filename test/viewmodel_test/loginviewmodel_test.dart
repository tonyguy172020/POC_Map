
import 'package:flutter_test/flutter_test.dart';
import 'package:touchins/view_models/login_viewmodel.dart';
import 'package:mockito/mockito.dart';

import 'authenticationservice_mock.dart';

void main() {

  //Mock setup
  AuthenticationServiceMock authenticationServiceMock =new AuthenticationServiceMock();

  when(authenticationServiceMock.login('kalidas@mail.com', '12345')).thenAnswer((_) => Future.value(true));

  LoginViewModel vm = new LoginViewModel(authenticationService: authenticationServiceMock);

  test('Login method testing', ()async {

   var succeed= await vm.login('kalidas@mail.com', '12345');

    expect(succeed, true);
  });
}



