import 'package:flutter/material.dart';
import 'package:mie_portfolio/service/url_launcher.dart';

import '../constants/color.dart';
import '../screens/projects_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AppBar(
      title: const Text(
        'M.O',
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
          onPressed: ()=> scrollToSection(homeKey),
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
          onPressed: ()=> scrollToSection(projectsKey),
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
          onPressed: ()=> scrollToSection(articlesKey),
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
          onPressed: ()=> scrollToSection(contactKey),
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