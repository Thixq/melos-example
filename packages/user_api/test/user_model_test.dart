import 'package:test/test.dart';
// user_api.dart içinde UserModel'in export edildiğinden emin ol veya doğrudan yolu ver:
import 'package:user_api/src/user_model.dart';

void main() {
  test('UserModel JSON serileştirme testi', () {
    final user = UserModel(id: '123', name: 'Kaan');

    final json = user.toJson();

    expect(json['id'], equals('123'));
    expect(json['name'], equals('Kaan'));
  });
}
