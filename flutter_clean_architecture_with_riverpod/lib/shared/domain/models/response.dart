// import 'package:dartz/dartz.dart';
// import 'package:flutter_clean_architecture_with_riverpod/shared/exceptions/http_exception.dart';
//
// class Response {
//   final String? statusMessage;
//   final dynamic data;
//   final int code;
//
//   Response(
//       {required this.code, this.statusMessage, this.data = const {}});
//   @override
//   String toString() {
//     return 'statusCode=$code\nstatusMessage=$statusMessage\n data=$data';
//   }
// }
//
// extension ResponseExtension on Response {
//   Right<AppException, Response> get toRight => Right(this);
// }

// To parse this JSON data, do
//
//     final parseResponse = parseResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../exceptions/http_exception.dart';

class Response {
  String? messageBn;
  final dynamic data;
  int code;

  Response({required this.code, this.messageBn, this.data = const {}});

}
extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
