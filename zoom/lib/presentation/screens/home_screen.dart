import 'package:flutter/material.dart';
import 'package:zoom/presentation/screens/chats_list_screen.dart';
import 'package:zoom/presentation/screens/contacts_screen.dart';
import 'package:zoom/presentation/screens/meetings_screen.dart';
import 'package:zoom/presentation/screens/settings_sceren.dart';
import 'package:zoom/utils/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.contact_page_outlined), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'Meet & Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.comment_rounded), label: 'Messanger'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: onPageChange,
        currentIndex: _page,
        backgroundColor: bottomNavBarColor,
        selectedItemColor: appAccentColor,
        unselectedItemColor: bottomNavBarItemUnselectedColor,
        unselectedLabelStyle: const TextStyle(color: bottomNavBarItemUnselectedColor),
      ),
    );
  }

  Widget _getCurrentScreen() {
    if (_page == 0) {
      return const ContactsScreen();
    } else if (_page == 1) {
      return const MeetingsScreen();
    } else if (_page == 2) {
      return const ChatsListScreen();
    } else {
      return const SettingsScreen();
    }
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }
}
