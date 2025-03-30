import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../data/projects_data.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/project_card.dart';


class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Animated Hero Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 80,
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 800),
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 800),
                      offset: const Offset(0, 0),
                      curve: Curves.easeOutQuart,
                      child: Column(
                        children: [
                          Text(
                            'My Projects',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Here are all the projects I\'ve worked on',
                            style: TextStyle(
                              fontSize: 18,
                              color: CustomColors.secondaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
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
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        // Staggered animation for each project card
                        return AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 500 + (index * 200)),
                          child: AnimatedSlide(
                            duration: Duration(milliseconds: 500 + (index * 200)),
                            curve: Curves.easeOut,
                            offset: const Offset(0, 0),
                            child: ProjectCard(
                              project: projects[index],
                              isPreview: false,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}