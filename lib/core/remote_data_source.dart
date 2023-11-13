import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  final Dio dio;

  RemoteDataSource({required Dio dio}) : dio = dio;
}
