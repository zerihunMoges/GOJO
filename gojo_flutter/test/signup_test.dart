
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/screen/signup.dart';

void main() {
  test('Non empty name returns null', () {
    var result = NameFieldValidator.validate('name');
    expect(result, null);
  });

  test('Empty name returns error', () {
    var result = NameFieldValidator.validate('');
    expect(result, "name not entered ");
  });

  test('Non empty lastname returns null', () {
    var result = LastNameFieldValidator.validate('lastname');
    expect(result, null);
  });

  test('Empty lastname returns error', () {
    var result = LastNameFieldValidator.validate('');
    expect(result, "last name not entered ");
  });

  test('Non empty username returns null', () {
    var result = UserNameFieldValidator.validate('username');
    expect(result, null);
  });

  test('Empty username returns error', () {
    var result = UserNameFieldValidator.validate('');
    expect(result, "username not entered ");
  }); 

  test('Non empty email returns null', () {
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });
  test('Empty email returns error', () {
    var result = EmailFieldValidator.validate('');
    expect(result, "email not entered ");
  });

  test('Non empty password returns null', () {
    var result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
  test('Empty password returns error', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, "password not entered ");
  });
  test('Non empty confirmpassword returns null', () {
    var result = ComfirmPasswordFieldValidator.validate('confirmpassword');
    expect(result, null);
  });
  test('Empty confirmpassword returns error', () {
    var result = ComfirmPasswordFieldValidator.validate('');
    expect(result, "please make sure to write the same password ");
  });


}