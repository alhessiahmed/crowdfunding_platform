// import 'dart:io';
// import '../shared_pref/shared_pref_controller.dart';
import '/model/api_response.dart';

mixin ApiHelper {
  ApiResponse get failedResponse => ApiResponse(
    message: 'Something went wrong!! try again later.',
    success: false,
  );

  // Map<String, String> get headers {
  //   return {
  //     HttpHeaders.authorizationHeader: SharedPrefController().token,
  //     HttpHeaders.acceptHeader: 'application/json',
  //   };
  // }

  // Map<String, String> get languageHeaders {
  //   return {
  //     'Accept': 'application/json',
  //     'Accept-Language': SharedPrefController().lang,
  //   };
  // }

  Map<String, String> get acceptHeader {
    return {'Accept': 'application/json'};
  }
}
