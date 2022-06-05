import 'package:flutter_test/flutter_test.dart';
import '../lib/auth/index.dart';

void main() {
  test('Non empty email returns null', () {
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });
  test('Empty email returns error', () {
    var result = EmailFieldValidator.validate('');
    expect(result, "email not entered ");
  });
  test('Non empty password returns null', () {
    var result = PasswordFiledValidator.validate('password');
    expect(result, null);
  });
  test('Empty password returns error', () {
    var result = PasswordFiledValidator.validate('');
    expect(result, "please enter your password");
  });
}
