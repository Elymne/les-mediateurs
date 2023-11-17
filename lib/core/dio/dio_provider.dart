import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TODO: Waiting for a posgrest.
final _options = BaseOptions(
  baseUrl: 'https://none-existing-api',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);

final Dio _dio = Dio(_options);

final dioProvider = Provider<Dio>((ref) => _dio);
