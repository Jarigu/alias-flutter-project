import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:alias_app/features/alias/repositories/http_alias_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('aliasRepositoryProvider is a HttpRepositoryProvider', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(providerContainer.read(aliasRepositoryProvider),
        isA<HttpAliasrepository>());
  });
}
