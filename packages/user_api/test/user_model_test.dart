import 'package:test/test.dart';
import 'package:user_api/src/user_model.dart';

void main() {
  test('UserModel JSON serialization test', () {
    final user = UserModel(id: '123', name: 'Kaan');

    final json = user.toJson();

    expect(json['id'], equals('123'));
    expect(json['name'], equals('Kaan'));
  });
}
