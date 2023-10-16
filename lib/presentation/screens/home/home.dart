import 'package:flutter/material.dart';
import 'package:mood_matic/presentation/screens/home/home_page.dart';
import 'package:mood_matic/services/auth.dart';

import '../../../models/usermodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> children = [
    const HomePage(),
    const Text('activity'),
    const Text('profile'),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: 'activity',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: Colors.white,
            ),
          ]),
      body: IndexedStack(
        index: currentIndex,
        children: children,
      ),
    );
  }
}
