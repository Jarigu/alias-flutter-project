import 'package:alias_app/features/alias/views/widgets/alias_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test-utils/pump_app.dart';

void main() {
  testWidgets(
    'render alias title',
    (WidgetTester tester) async {
      await tester.pumpProviderApp(
        const Material(
          child: AliasAppBar(),
        ),
        overrides: [],
      );

      await tester.pumpAndSettle();

      expect(find.text('Alias'), findsOneWidget);
    },
  );
}
