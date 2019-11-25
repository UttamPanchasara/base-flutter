import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'app_exception.dart';

class RxConverter {
  Observable<T> callApi<T>(Future<T> future) {
    return Observable.fromFuture(Connectivity().checkConnectivity())
        .map((connectivityResult) =>
            connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi)
        .map((connected) {
      if (!connected) throw NoInternetException('');

      return connected;
    }).flatMap((connected) => Observable.fromFuture(future));
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse;
        try {
          jsonResponse = json.decode(response.data.toString());
        } catch (e) {
          print('RxConverter:Error while decoding json: $e');
          jsonResponse = response.data.toString();
        }
        return jsonResponse;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
