import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mie_portfolio/screens/project_section.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color.dart';
import '../service/url_launcher.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import 'acticle_section.dart';
import 'blog_screen.dart';
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
              child: Row(
                children: [
                  if (!isMobile) ...[
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
                            "I'm a skilled, and product-oriented Mobile Engineer with 3+ years of experience working in a variety of fast-paced, dynamic, environments. Experience includes building and designing beautiful User interfaces, ensuring seamless user experiences, and optimizing app performance across platforms. Passionate about creating innovative mobile solutions that delight users and drive business value.",
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.textDark,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 20),
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

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/svg/github.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://github.com/Michael-Ogundipe');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/linkedin.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://www.linkedin.com/in/michael-ogundipe-9a9b8b173/');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/gmail.svg', width: 30),
          onPressed: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'ogundipeibukun51@gmail.com',
              queryParameters: {
                'subject': 'Hello!',
                'body': 'I wanted to reach out to you...',
              },
            );

            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            } else {
              throw 'Could not launch $emailUri';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/x.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://x.com/syntax007');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
      ],
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BlogScreen(),
                ),
              );
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