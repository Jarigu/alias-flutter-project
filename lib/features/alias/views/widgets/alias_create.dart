import 'package:alias_app/features/alias/logic/alias_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AliasCreate extends ConsumerStatefulWidget {
  const AliasCreate({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AliasCreateState();
}

class _AliasCreateState extends ConsumerState<AliasCreate> {
  late TextEditingController inputSearchController;

  @override
  void initState() {
    inputSearchController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: inputSearchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
              onSubmitted: (value) {
                ref.read(aliasProvider.notifier).create(value);

                inputSearchController.clear();
              },
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: () {
              ref
                  .read(aliasProvider.notifier)
                  .create(inputSearchController.text);

              inputSearchController.clear();
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
