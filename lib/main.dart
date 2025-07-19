import 'package:cyanaseapp/appBar.dart';
import 'package:cyanaseapp/faqs.dart';
import 'package:cyanaseapp/goals.dart';
import 'package:cyanaseapp/groups.dart';
import 'package:cyanaseapp/help.dart';
import 'package:cyanaseapp/home.dart';
import 'package:cyanaseapp/notification_settings.dart';
import 'package:cyanaseapp/notifications.dart';
import 'package:cyanaseapp/profile.dart';
import 'package:cyanaseapp/risk_profile_setting.dart';
import 'package:cyanaseapp/settings.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyanase',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Cyanase'),
        '/notifications': (context) => const NotificationPage(),
        '/settings':
            (context) => SettingsList(
              onAccountTap: () => Navigator.pushNamed(context, '/profile'),
              onNotificationsTap:
                  () => Navigator.pushNamed(context, '/notificationsettings'),
              onRiskProfileTap:
                  () => Navigator.pushNamed(context, '/riskprofilesetting'),
              onFaqsTap: () => Navigator.pushNamed(context, '/faqs'),
              onHelpTap: () => Navigator.pushNamed(context, '/help'),
            ),
        '/profile': (context) => const ProfilePage(),
        '/faqs': (context) => const FAQsPage(),
        '/help': (context) => const HelpPage(),
        '/riskprofilesetting': (context) => const RiskProfileSettingPage(),
        '/notificationsettings': (context) => const NotificationSettingsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;
  final List<Widget> _pages = [
    Center(child: HomePage()),
    Center(child: GroupsPage(show: false)),
    Center(child: GoalsPage(show: false)),
  ];
  final List<String> _titles = ['Cyanase', 'Groups', 'Goals'];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: _titles[_selectedIndex]),
      body: Container(
        color: AppThemes.lightTheme.scaffoldBackgroundColor,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.bottomCenter,
        //     end: Alignment.topCenter,
        //     colors: [
        //       Color.fromARGB(255, 242, 245, 250),
        //       Color.fromARGB(255, 242, 245, 250),
        //     ],
        //   ),
        // ),
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _pages,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
