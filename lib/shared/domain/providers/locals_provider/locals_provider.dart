import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/shared/data/local/locals.dart';

final _locals = Locals();
final localsProvider = Provider<Locals>((ref) {
  return _locals;
});
