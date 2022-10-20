import 'package:alias_app/core/services/http/http_service.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAliasRepository extends Mock implements AliasRepository {}

class MockHttpService extends Mock implements HttpService {}

class Listener<T> extends Mock {
  void call(T? previous, T value);
}
