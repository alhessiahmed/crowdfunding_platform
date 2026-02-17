class ApiSettings {
  // BASE
  static const String _baseUrl =
      'https://gsg-project-group-2-production.up.railway.app/api/v1';

  // AUTH
  static const String _auth = '$_baseUrl/auth';
  static const String login = '$_auth/login';
  static const String _register = '$_auth/register';
  static const String registerDonor = '$_register/donor';
  // static const String verify = '$_auth/verify';
  // static const String resendCode = '$_auth/resendCode';
  // static const String resetPassword = '$_auth/passwordReset';
  // static const String googleLogin = '$_auth/authByGoogle';

  // HOME
  // static const String home = '$_baseUrl/home';

  // DONOR
  static const String donor = '$_baseUrl/donor';
  static const String campaign = '$_baseUrl/campaign';
}
