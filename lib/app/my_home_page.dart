import 'package:cyanaseapp/core/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/app/app_bar.dart';
import 'package:cyanaseapp/features/goals/views/goals.dart';
import 'package:cyanaseapp/features/chat/views/groups.dart';
import 'package:cyanaseapp/features/home/views/home.dart';
import 'package:cyanaseapp/core/models/theme.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  static const List<Widget> _pages = [
    HomePage(),
    GroupsPage(show: false),
    GoalsPage(show: false),
  ];

  static const List<String> _titles = ['Cyanase', 'Groups', 'Goals'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      appBar: MyAppBar(title: _titles[selectedIndex]),
      body: Container(
        color: AppThemes.lightTheme.scaffoldBackgroundColor,
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(tabIndexProvider.notifier).state = index;
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_rounded),
            label: 'My Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ads_click_rounded),
            label: 'My Goals',
          ),
        ],
      ),
    );
  }
}
