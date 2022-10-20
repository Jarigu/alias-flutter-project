import 'package:alias_app/features/alias/logic/alias_provider.dart';
import 'package:alias_app/features/alias/models/alias_model.dart';
import 'package:alias_app/features/alias/views/widgets/alias_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasHistoryList extends ConsumerWidget {
  const AliasHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AliasModel> aliasList = ref.watch(aliasesProvider);
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: aliasList.length,
      itemBuilder: ((context, index) {
        return AliasCard(
            originalUrl: aliasList[index].originalUrl,
            shortUrl: aliasList[index].shortUrl);
      }),
    );
  }
}
