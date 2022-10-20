import 'package:alias_app/alias_app.dart';
import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:alias_app/features/alias/logic/alias_provider.dart';
import 'package:alias_app/features/alias/logic/alias_state.dart';
import 'package:alias_app/features/alias/logic/alias_state_notifier.dart';
import 'package:alias_app/features/alias/repositories/alias_repository.dart';
import 'package:alias_app/features/alias/views/pages/alias_page.dart';
import 'package:alias_app/features/alias/views/widgets/alias_history_list.dart';
import 'package:alias_app/features/alias/views/widgets/alias_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test-utils/dummy-data/dummy_alias.dart';
import '../../../../test-utils/mocks.dart';
import '../../../../test-utils/pump_app.dart';

void main() {
  group('AliasPage', () {
    late AliasRepository repository;

    setUp(() {
      repository = MockAliasRepository();
    });

    StateNotifierProvider<AliasNotifier, AliasState> overrideNotifier(
      AliasState initialState,
    ) =>
        StateNotifierProvider<AliasNotifier, AliasState>(
          (_) => AliasNotifier(
            aliasRepository: repository,
          ),
        );

    testWidgets('Render default page', (WidgetTester tester) async {
      // Setup
      await tester.pumpProviderApp(
        const Material(
          child: AliasApp(),
        ),
        overrides: [],
      );

      await tester.pumpAndSettle();
      //Expect
      expect(find.byType(AliasPage), findsOneWidget);
    });

    testWidgets('Loading shimmer indicator when Alias is loading',
        (WidgetTester tester) async {
      await tester.pumpProviderApp(
        const Material(
          child: AliasApp(),
        ),
        overrides: [
          aliasProvider.overrideWithProvider(
            overrideNotifier(
              const AliasState(status: AliasStatus.loading, aliases: []),
            ),
          ),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.byType(AliasShimmer), findsOneWidget);
    });

    testWidgets('Data is loaded', (WidgetTester tester) async {
      await tester.pumpProviderApp(
        const Material(
          child: AliasPage(),
        ),
        overrides: [
          aliasProvider.overrideWithProvider(
            overrideNotifier(
              AliasState(
                  status: AliasStatus.loaded,
                  aliases: [DummyAlias.aliasModel1]),
            ),
          ),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.byType(AliasHistoryList), findsOneWidget);
    });
  });
}
