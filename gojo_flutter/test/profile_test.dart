import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/screen/profile.dart';


void main( ) {

  test('Non empty user name returns null', () {
    var result = UserNameCtrlFieldValidator.validate('user name');
    expect(result, null);
  });

  test('Empty user name returns error', () {
    var result = UserNameCtrlFieldValidator.validate('');
    expect(result, "please enter username");
  });

  test('Non empty first name returns null', () {
    var result = FirstNameFieldValidator.validate('first name');
    expect(result, null);
  });

  test('Empty first name returns error', () {
    var result = FirstNameFieldValidator.validate('');
    expect(result, "please enter your first name " );
  });

  test('Non empty last name returns null', () {
    var result = LastNameFieldValidator.validate('last name');
    expect(result, null);
  });

  test('Empty last name returns error', () {
    var result = LastNameFieldValidator.validate('');
    expect(result, "please enter your last name ");
  });

  test('Non empty email returns null', () {
    var result = EmailCtrlFieldValidator.validate('email');
    expect(result, null);
  });

  test('Empty email returns error', () {
    var result = EmailCtrlFieldValidator.validate('');
    expect(result,  "Please enter your email" );
  });
  
}