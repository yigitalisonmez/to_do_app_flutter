import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/view_models/home_view_model.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static String path = '/home-view';
  int _selectedIndex = 1;
  List<Widget> screens = [
    const TodoView(),
    NotesView(),
    const RoutinesView(),
  ];
  List<GButton> buttons = [
    const GButton(
      icon: Icons.home_outlined,
      text: 'Home',
      iconColor: kIconColor,
    ),
    const GButton(
      icon: Icons.menu_book,
      text: 'Notes',
      iconColor: kIconColor,
    ),
    const GButton(
      icon: Icons.calendar_today,
      text: 'Profile',
      iconColor: kIconColor,
    )
  ];

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[Provider.of<HomeViewModel>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GNav(
          tabBackgroundColor: kSecondaryColor,
          rippleColor:
              Colors.grey.shade800, // tab button ripple color when pressed
          hoverColor: Colors.grey.shade700, // tab button hover color
          haptic: true, // haptic feedback
          // tab button shadow
          curve: Curves.linear,
          duration: const Duration(milliseconds: 250), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: kIconColor, // selected icon and text color
          iconSize: 26, // tab button icon size
          // selected tab background color
          padding: const EdgeInsets.all(12),
          tabs: widget.buttons,
          onTabChange: (index) {
            Provider.of<HomeViewModel>(context, listen: false)
                .navigateTo(index);
          },
        ),
      ),
    );
  }
}
