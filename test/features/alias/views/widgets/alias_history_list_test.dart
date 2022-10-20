import 'package:alias_app/features/alias/logic/alias_provider.dart';
import 'package:alias_app/features/alias/views/widgets/alias_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test-utils/dummy-data/dummy_alias.dart';
import '../../../../test-utils/pump_app.dart';

void main() {
  testWidgets(
    'renders alias data',
    (WidgetTester tester) async {
      await tester.pumpProviderApp(
        const Material(
          child: AliasHistoryList(),
        ),
        overrides: [
          aliasesProvider.overrideWithValue(
            [DummyAlias.aliasModel1],
          ),
        ],
      );

      await tester.pumpAndSettle();

      expect(
          find.text('Short url ${DummyAlias.aliasModel1.shortUrl}',
              findRichText: true),
          findsOneWidget);
    },
  );
}
