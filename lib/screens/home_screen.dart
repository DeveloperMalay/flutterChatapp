import 'package:chatapp/mythems/mytheme.dart';
import 'package:chatapp/pages/calls_page.dart';
import 'package:chatapp/pages/contacts_page.dart';
import 'package:chatapp/pages/messages_page.dart';
import 'package:chatapp/pages/notification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NaviagtionBarItem(
            index: 0,
            label: 'Message',
            isSelected: (selectedIndex == 0),
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: handleItemSelected,
          ),
          _NaviagtionBarItem(
            index: 1,
            label: 'Notification',
            isSelected: (selectedIndex == 1),
            icon: CupertinoIcons.bell_solid,
            onTap: handleItemSelected,
          ),
          _NaviagtionBarItem(
            index: 2,
            label: 'Call',
            isSelected: (selectedIndex == 2),
            icon: CupertinoIcons.phone_fill,
            onTap: handleItemSelected,
          ),
          _NaviagtionBarItem(
            index: 3,
            label: 'Cotacts',
            isSelected: (selectedIndex == 3),
            icon: CupertinoIcons.person_2_fill,
            onTap: handleItemSelected,
          ),
        ],
      ),
    );
  }
}

class _NaviagtionBarItem extends StatelessWidget {
  const _NaviagtionBarItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);
  final ValueChanged<int> onTap;
  final int index;
  final String label;
  final bool isSelected;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    )
                  : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
