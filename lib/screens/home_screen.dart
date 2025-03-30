import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_portfolio/widgets/footer.dart';
// import 'package:flutter_portfolio/screens/projects_screen.dart';
// import 'package:flutter_portfolio/screens/experience_screen.dart';
// import 'package:flutter_portfolio/screens/blog_screen.dart';
// import 'package:flutter_portfolio/screens/contact_screen.dart';

import '../constants/color.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: const CustomAppBar(),
    //  drawer: isMobile ? _buildDrawer(context) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 50,
              ),
              child: Row(
                children: [
                  if (!isMobile) ...[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, I\'m John Doe',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Building Scalable Flutter Apps with a Touch of AI',
                            style: TextStyle(
                              fontSize: 24,
                              color: CustomColors.secondaryDark,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'I\'m a Flutter developer passionate about creating beautiful, performant mobile and web applications. With 3 years of experience, I specialize in cross-platform development and AI integration.',
                            style: TextStyle(
                              fontSize: 18,
                              color: CustomColors.textDark,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 30),
                          _buildSocialLinks(),
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
                  ] else ...[
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Hi, I\'m John Doe',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.primaryDark,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Building Scalable Flutter Apps with a Touch of AI',
                          style: TextStyle(
                            fontSize: 18,
                            color: CustomColors.secondaryDark,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'I\'m a Flutter developer passionate about creating beautiful, performant mobile and web applications. With 3 years of experience, I specialize in cross-platform development and AI integration.',
                          style: TextStyle(
                            fontSize: 16,
                            color: CustomColors.textDark,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        _buildSocialLinks(),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Projects Preview Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80),
              decoration: BoxDecoration(
                color: CustomColors.bgLight2,
              ),
              child: Column(
                children: [
                  Text(
                    'Featured Projects',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Here are some of my recent works',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.secondaryDark,
                    ),
                  ),
                  const SizedBox(height: 50),
                  //_buildProjectsPreview(context),
                  const SizedBox(height: 30),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const ProjectsScreen(),
                  //       ),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: CustomColors.primaryDark,
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 30,
                  //       vertical: 15,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   child: const Text(
                  //     'View All Projects',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // Footer
           // const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/svg/github.svg', width: 30),
          onPressed: () {
            // Launch GitHub URL
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/linkedin.svg', width: 30),
          onPressed: () {
            // Launch LinkedIn URL
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/gmail.svg', width: 30),
          onPressed: () {
            // Launch Email
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/x.svg', width: 30),
          onPressed: () {
            // Launch Email
          },
        ),
      ],
    );
  }

  Widget _buildProjectsPreview(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      width: isMobile ? screenWidth * 0.9 : screenWidth * 0.8,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: isMobile ? 1.2 : 1.5,
        ),
        itemCount: 2, // Show only 2 projects in preview
        itemBuilder: (context, index) {
          return ProjectCard(
            project: projects[index],
            isPreview: true,
          );
        },
      ),
    );
  }

  // Widget _buildDrawer(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: [
  //         const DrawerHeader(
  //           decoration: BoxDecoration(
  //             color: Colors.blue,
  //           ),
  //           child: Text(
  //             'My Portfolio',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 24,
  //             ),
  //           ),
  //         ),
  //         ListTile(
  //           title: const Text('Home'),
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //         ListTile(
  //           title: const Text('Projects'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => const ProjectsScreen(),
  //               ),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           title: const Text('Experience'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => const ExperienceScreen(),
  //               ),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           title: const Text('Blog'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => const BlogScreen(),
  //               ),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           title: const Text('Contact'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => const ContactScreen(),
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}