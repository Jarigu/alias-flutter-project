import 'package:flutter/material.dart';

class AliasAppBar extends StatelessWidget {
  const AliasAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const ValueKey('app_bar_title_alias'),
      child: const Text('Alias'),
    );
  }
}
