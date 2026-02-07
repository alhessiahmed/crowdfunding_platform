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
