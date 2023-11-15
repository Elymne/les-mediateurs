import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  final Dio dio;

  RemoteDatasource({required this.dio});
}
