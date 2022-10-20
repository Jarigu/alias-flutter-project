import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:alias_app/features/alias/logic/alias_state.dart';
import 'package:alias_app/features/alias/logic/alias_state_notifier.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test-utils/dummy-data/dummy_alias.dart';
import '../../../test-utils/mocks.dart';

void main() {
  group('alias state notifier', () {
    late AliasRepository repository;
    late AliasNotifier aliasNotifier;

    setUp(() {
      repository = MockAliasRepository();
      aliasNotifier = AliasNotifier(aliasRepository: repository);
    });

    test('first state is AliasState.initial', () {
      expect(aliasNotifier.debugState, AliasState.initial());
    });

    group('create Alias', (() {
      test(
          'emits AliasState with status loading and loaded on successfull repository call',
          () async {
        when(() => repository.createAlias(
            originalUrl: DummyAlias.aliasModel1.originalUrl)).thenAnswer(
          (_) async => DummyAlias.aliasModel1,
        );

        final states = <AliasState>[];
        aliasNotifier.addListener((state) {
          states.add(state);
        });

        await aliasNotifier.create(DummyAlias.aliasModel1.originalUrl);

        expect(states, [
          AliasState.initial(),
          const AliasState(status: AliasStatus.loading, aliases: []),
          AliasState(
            status: AliasStatus.loaded,
            aliases: [DummyAlias.aliasModel1],
          ),
        ]);
      });

      test('emits AliasState loading and exception ', () async {
        when(() => repository.createAlias(
            originalUrl: DummyAlias.aliasModel1.originalUrl)).thenThrow(
          Exception(),
        );

        final states = <AliasState>[];
        aliasNotifier.addListener(
          (state) {
            states.add(state);
          },
        );

        await aliasNotifier.create(DummyAlias.aliasModel1.originalUrl);

        expect(states, [
          AliasState.initial(),
          const AliasState(status: AliasStatus.loading, aliases: []),
          const AliasState(status: AliasStatus.exception, aliases: []),
        ]);
      });
    }));
  });
}
