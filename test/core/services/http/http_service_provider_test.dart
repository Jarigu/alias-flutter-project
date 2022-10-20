import 'package:alias_app/core/services/http/dio_http_service.dart';
import 'package:alias_app/core/services/http/http_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('httpServiceProvider is a DioHttpService', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(httpServiceProvider),
      isA<DioHttpService>(),
    );
  });
}
