import 'package:alias_app/features/alias/views/pages/alias_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasApp extends ConsumerWidget {
  const AliasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: 'Alias App',
      themeMode: ThemeMode.light,
      home: AliasPage(),
    );
  }
}
