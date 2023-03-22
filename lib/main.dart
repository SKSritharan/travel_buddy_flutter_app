import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_buddy/widgets/custom_search_bar.dart';

import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../utils/app_theme.dart';
import '../widgets/custom_app_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppTheme>(
      create: (_) => AppTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeScreen(), FavoritesScreen()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);

    return MaterialApp(
      title: 'Travel Buddy',
      theme: themeProvider.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(
          title: 'Travel Buddy',
        ),
        body: _children[_currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.search),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
        ),
      ),
    );
  }
}
