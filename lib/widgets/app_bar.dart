import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AppBar(
      title: const Text(
        'My Portfolio',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      backgroundColor: CustomColors.bgLight1,
      elevation: 0,
      centerTitle: false,
      actions: isMobile
          ? null
          : [
        TextButton(
          onPressed: () {
            // Already on home
          },
          child: Text(
            'Home',
            style: TextStyle(
              color: CustomColors.primaryDark,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/projects');
          },
          child: Text(
            'Projects',
            style: TextStyle(
              color: CustomColors.textDark,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/experience');
          },
          child: Text(
            'Experience',
            style: TextStyle(
              color: CustomColors.textDark,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/blog');
          },
          child: Text(
            'Blog',
            style: TextStyle(
              color: CustomColors.textDark,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/contact');
          },
          child: Text(
            'Contact',
            style: TextStyle(
              color: CustomColors.textDark,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}