import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mie_portfolio/screens/project_section.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color.dart';
import '../constants/strings.dart';
import '../service/url_launcher.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/social_links.dart';
import 'acticle_section.dart';
import 'contact_screen.dart';
import 'projects_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 final  _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isBreakPoint = screenWidth < 830;

    return Scaffold(
      appBar:  CustomAppBar(),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            Container(
              key: homeKey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 50,
              ),
              child: !isBreakPoint? Row(
                children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Michael Ogundipe',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Flutter Engineer',
                        style: TextStyle(
                          fontSize: 24,
                          color: CustomColors.secondaryDark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        aboutMe,
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.textDark,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SocialLinks(),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/profile.jpeg',
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ): Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Michael Ogundipe',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Flutter Engineer',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.secondaryDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    aboutMe,
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.textDark,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  SocialLinks(),
                ],
              ),
            ),

            // Projects Preview Section
            ProjectsSection(
              key: projectsKey,
            ),
            ArticlesSection(
              key: articlesKey,
            ),

            // Footer
             Footer(
              key: contactKey,
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'My Portfolio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProjectsScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('Blog'),
            onTap: () {

            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}