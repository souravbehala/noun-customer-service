import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  MyAppBar(this.title, this.showBackButton);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // automaticallyImplyLeading: showBackButton,
      leading: IconButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BottomNavigation())),
          icon: const Icon(Icons.arrow_back, color: Colors.white)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
