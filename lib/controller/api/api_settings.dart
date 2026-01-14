class ApiSettings {
  static const String _baseUrl = 'http://myapp.com/api/v1';

  // AUTH
  static const String _auth = '$_baseUrl/user';
  static const String register = '$_auth/register';
  static const String login = '$_auth/login';
  static const String verify = '$_auth/verify';
  static const String resendCode = '$_auth/resendCode';
  static const String resetPassword = '$_auth/passwordReset';
  static const String googleLogin = '$_auth/authByGoogle';

  // HOME
  static const String home = '$_baseUrl/home';
}
