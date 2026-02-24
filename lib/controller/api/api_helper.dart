import 'dart:async';
import 'dart:io';
import '/model/api_response.dart';

mixin ApiHelper {
  ApiResponse<T> failedResponse<T>() => ApiResponse<T>(
    message: 'Something went wrong!! try again later.',
    success: false,
  );

  Map<String, String> get acceptHeader => {
    HttpHeaders.acceptHeader: 'application/json',
  };

  Map<String, String> get authHeader => {
    HttpHeaders.acceptHeader: 'application/json',
    // HttpHeaders.authorizationHeader:
    //     'Bearer ${SharedPrefController().token}',
  };

  Map<String, String> languageHeader(String lang) => {
    HttpHeaders.acceptHeader: 'application/json',
    'Accept-Language': lang,
  };

  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 2));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    }
  }
}

// // import 'dart:io';
// // import '../shared_pref/shared_pref_controller.dart';
// import '/model/api_response.dart';

// mixin ApiHelper {
//   ApiResponse get failedResponse => ApiResponse(
//     message: 'Something went wrong!! try again later.',
//     success: false,
//   );

//   // Map<String, String> get headers {
//   //   return {
//   //     HttpHeaders.authorizationHeader: SharedPrefController().token,
//   //     HttpHeaders.acceptHeader: 'application/json',
//   //   };
//   // }

//   // Map<String, String> get languageHeaders {
//   //   return {
//   //     'Accept': 'application/json',
//   //     'Accept-Language': SharedPrefController().lang,
//   //   };
//   // }

//   Map<String, String> get acceptHeader {
//     return {'Accept': 'application/json'};
//   }
// }
