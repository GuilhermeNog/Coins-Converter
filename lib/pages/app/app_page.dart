import 'package:coinsconverter/pages/home/home_page.dart';
import 'package:coinsconverter/pages/info/info_page.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Coins Converter"),
      ),
      body: IndexedStack(
        children: [
          HomePage(),
          InfoPage(),
        ],
        index: _selectedIndex,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.paid_outlined,
            ),
            selectedIcon: Icon(
              Icons.paid,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.info_outline,
            ),
            selectedIcon: Icon(
              Icons.info,
            ),
            label: 'Info',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
