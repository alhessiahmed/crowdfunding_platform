import 'user.dart';

class AuthResult {
  final User user;
  final String token;

  AuthResult({required this.user, required this.token});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(user: User.fromJson(json['user']), token: json['token']);
  }
}
