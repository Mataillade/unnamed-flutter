// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:unnamed/screens/home/Chat/chat.dart';
import 'package:unnamed/screens/home/Contact/contact.dart';
import 'package:unnamed/screens/home/Parameter/parameter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _page = [
    Contact(),
    Chat(),
    const Parameter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person_search), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.engineering_outlined), label: "Parameters")
        ],

      ),

    );
  }

}
