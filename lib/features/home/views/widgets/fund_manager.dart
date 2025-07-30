import 'package:cyanaseapp/core/providers/fund_manager_provider.dart';
import 'package:cyanaseapp/features/home/views/widgets/fund_manager_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FundManagerList extends ConsumerWidget {
  const FundManagerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundManagersAsync = ref.watch(fundManagerProvider);

    return fundManagersAsync.when(
      data:
          (managers) => SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: managers.length,
              itemBuilder: (context, index) {
                final manager = managers[index];
                return FundManagerCard(
                  name: manager.firstName,
                  category: manager.profile.companyCategory,
                  imageUrl: manager.profile.profilePicture,
                  gain: 12000, // example value
                  loss: 3500, // example value
                  onTap: () {
                    // navigate or show detail
                  },
                );
              },
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }
}
