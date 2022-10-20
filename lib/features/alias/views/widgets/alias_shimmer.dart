import 'package:alias_app/core/widgets/shimmer.dart';
import 'package:alias_app/features/alias/enums/alias_status.dart';
import 'package:alias_app/features/alias/logic/alias_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasShimmer extends ConsumerWidget {
  const AliasShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AliasStatus status = ref.watch(aliasStatusProvider);

    if (status == AliasStatus.loading) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
              ),
          border: Border.all(
            width: 2.0,
            color: Colors.grey.shade400,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Shimmer(
              width: double.infinity,
              height: 14,
            ),
            SizedBox(
              height: 5.0,
            ),
            Shimmer(
              width: double.infinity,
              height: 14,
            ),
            SizedBox(
              height: 8.0,
            ),
            Shimmer(
              width: double.infinity,
              height: 14,
            ),
            SizedBox(
              height: 5.0,
            ),
            Shimmer(
              width: double.infinity,
              height: 14,
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
