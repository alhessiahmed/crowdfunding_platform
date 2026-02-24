import 'user.dart';

class AuthResult {
  final User user;
  final String token;

  AuthResult({required this.user, required this.token});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    final String token = (json['token'] ?? '').toString();
    final dynamic rootUser = json['user'] ?? json['userData'];
    final dynamic data = json['data'];
    final dynamic dataUser =
        data is Map<String, dynamic> ? (data['user'] ?? data['userData']) : null;

    final Map<String, dynamic>? userMap = rootUser is Map<String, dynamic>
        ? Map<String, dynamic>.from(rootUser)
        : dataUser is Map<String, dynamic>
        ? Map<String, dynamic>.from(dataUser)
        : null;

    if (token.isEmpty || userMap == null) {
      throw const FormatException('Invalid auth response shape');
    }

    return AuthResult(user: User.fromJson(userMap), token: token);
  }
}
