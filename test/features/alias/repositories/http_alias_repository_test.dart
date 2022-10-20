import 'package:alias_app/core/services/http/http_service.dart';
import 'package:alias_app/features/alias/repositories/http_alias_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test-utils/dummy-data/dummy_alias.dart';
import '../../../test-utils/mocks.dart';

void main() {
  final HttpService mockHtppService = MockHttpService();
  final httpAliasRepository = HttpAliasrepository(mockHtppService);

  test('fetches alias create', () async {
    when(
      () => mockHtppService.post(
        httpAliasRepository.path,
        data: <String, dynamic>{
          'url': DummyAlias.aliasModel1.originalUrl,
        },
      ),
    ).thenAnswer((_) async => DummyAlias.rawAlias1);

    final alias = await httpAliasRepository.createAlias(
      originalUrl: DummyAlias.aliasModel1.originalUrl,
    );

    expect(alias, DummyAlias.aliasModel1);
  });
}
