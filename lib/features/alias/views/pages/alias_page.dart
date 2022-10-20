import 'package:alias_app/features/alias/views/widgets/alias_app_bar.dart';
import 'package:alias_app/features/alias/views/widgets/alias_create.dart';
import 'package:alias_app/features/alias/views/widgets/alias_history_list.dart';
import 'package:alias_app/features/alias/views/widgets/alias_shimmer.dart';
import 'package:flutter/material.dart';

class AliasPage extends StatelessWidget {
  const AliasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AliasAppBar(),
      ),
      body: Column(
        children: const [
          AliasCreate(),
          AliasShimmer(),
          Expanded(
            child: AliasHistoryList(),
          ),
        ],
      ),
    );
  }
}
