import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/app_bar.dart';
import 'package:flutter_portfolio/widgets/footer.dart';
import 'package:flutter_portfolio/widgets/project_card.dart';
import 'package:flutter_portfolio/data/projects_data.dart';

import '../constants/color.dart';
import '../widgets/app_bar.dart';

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
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 80,
              ),
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
                        return ProjectCard(
                          project: projects[index],
                          isPreview: false,
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