import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failures{
  final String errMessage;
  Failures(this.errMessage);
}

class ServerFailure extends Failures{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException)
  {
    switch(dioException.type)
    {

      case DioExceptionType.connectionTimeout:
        return ServerFailure('ConnectionTimeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response?.statusCode,dioException.response?.data!);
      case DioExceptionType.cancel:
      return ServerFailure('cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('unknconnectionErrorown');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');

      default:
        return ServerFailure('opS there was an error, please try again later');


    }
  }


  factory ServerFailure.fromResponse(int? statusCode, dynamic response){
    if(statusCode==400 || statusCode==401 || statusCode==403)
      {
        return ServerFailure(response['error']['message']);
      }
    else if(statusCode==404)
      {
        return ServerFailure('Your request not found!');
      }
    else if(statusCode==500)
      {
        return ServerFailure('Internal Server error');
      }
    else {
      return ServerFailure('opS there was an error, please try again later');
    }
  }
}








