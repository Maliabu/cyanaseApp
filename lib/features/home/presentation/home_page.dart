// features/home/presentation/home_page.dart
import 'package:cyanaseapp/scrollWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/home_viewmodel.dart';
import 'widgets/wallet_card.dart'; // extract your WalletCard widget here
import 'widgets/fund_manager_card.dart'; // extract fund manager card if you want

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    }

    return ScrollablePage(
      child: Column(
        children: [
          if (state.portfolio.isNotEmpty)
            WalletCard(
              cardHolder: state.portfolio[0].cardHolder,
              cardNumber: state.portfolio[0].cardNumber,
              expiryDate: state.portfolio[0].expiryDate,
              onTap: () {
                print('Card selected');
              },
            ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(2),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.fundManagers.length,
              itemBuilder: (context, index) {
                final manager = state.fundManagers[index];
                return FundManagerCard(
                  name: manager.name,
                  imageUrl: manager.imageUrl,
                  gain: manager.gain,
                  loss: manager.loss,
                  category: manager.category,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
