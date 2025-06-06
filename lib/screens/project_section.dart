import 'package:flutter/material.dart';

import '../service/url_launcher.dart';
import '../widgets/more_projects.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Project> _projects = [
    Project(
      title: 'GemiLingo',
      projectType: 'GitHub',
      imageAsset: 'assets/images/gemilingo.jpeg',
      description: 'A powerful AI-driven language translation app designed to break language barriers. Whether you\'re a traveler, a student, or a business professional, Gemilingo helps you communicate effortlessly with real-time translation features.',
      technologies: ['Flutter','Gemini AI'],
      urls: ['https://github.com/Michael-Ogundipe/gemilingo'],
    ),
    Project(
      title: 'Heyflutter.com',
      projectType: 'Website',
      imageAsset: 'assets/images/heyflutter.png',
      description: ' A responsive website built with Flutter, featuring a sleek UI, smooth animations and an intuitive user experience to highlight HeyFlutter\'s services and online Flutter training courses',
      technologies: ['Flutter', 'Firebase', 'TypeScript'],
      urls: ['https://heyflutter.com/'],
    ),
    Project(
      title: 'Luxtrade',
      projectType: 'Both Stores',
      imageAsset: 'assets/images/luxtrade.jpg',
      description: 'Your Gateway to Digital Finance and Exchange. Effortlessly trade crypto, pay bills, and receive international payments in Nigeria. Secure, fast, and user-friendly.',
      technologies: ['Flutter'],
      urls: ['https://apps.apple.com/ng/app/luxtrade/id6443710711','https://play.google.com/store/apps/details?id=com.lux.luxTrade&pcampaignid=web_share'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 100,
          vertical: 50,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 0.2, curve: Curves.easeOut),
              ),
            ),
            child: const Text(
              'Latest Projects',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3E50),
              ),
            ),
          ),
          const SizedBox(height: 4),
          FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.1, 0.3, curve: Curves.easeOut),
              ),
            ),
            child: Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF3498DB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Projects List with hover effects
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              // Calculate delay for each item
              final start = 0.2 + (index * 0.1);
              final end = start + 0.2;

              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.5, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(start, end, curve: Curves.easeOut),
                  ),
                ),
                child: FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval(start, end, curve: Curves.easeOut),
                    ),
                  ),
                  child: HoverProjectCard(project: _projects[index]),
                ),
              );
            },
          ),
          const SizedBox(height: 36),
          MoreProjectsWidget(title: 'Projects', url: 'https://github.com/Michael-Ogundipe',)
        ],
      ),
    );
  }
}

class HoverProjectCard extends StatefulWidget {
  final Project project;

  const HoverProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  State<HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<HoverProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
              offset: Offset(0, _isHovered ? 6 : 3),
              blurRadius: _isHovered ? 12 : 8,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            onHover: (hovering) => setState(() => _isHovered = hovering),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool useRowLayout = constraints.maxWidth > 500;
                  return AnimatedScale(
                    duration: const Duration(milliseconds: 100),
                    scale: _isHovered ? 1.01 : 1.0,
                    child: useRowLayout
                        ? _buildRowLayout()
                        : _buildColumnLayout(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Project details
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                widget.project.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3E50),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.project.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF34495E),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.technologies.map((tech) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.identity()
                      ..scale(_isHovered ? 1.05 : 1.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3498DB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF3498DB).withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3498DB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              widget.project.projectType.contains('Both')?
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _isHovered
                          ? const Color(0xFF2D3E50).withOpacity (0.9)
                          : Colors.transparent,
                    ),
                    child: OutlinedButton.icon(
                      onPressed: () =>launchURl(widget.project.urls[0]),
                      icon: Icon(
                        Icons.code,
                        size: 16,
                        color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                      ),
                      label: Text(
                        'App Store',
                        style: TextStyle(
                          color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _isHovered
                              ? Colors.transparent
                              : const Color(0xFF2D3E50),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _isHovered
                          ? const Color(0xFF2D3E50).withOpacity (0.9)
                          : Colors.transparent,
                    ),
                    child: OutlinedButton.icon(
                      onPressed: () =>launchURl(widget.project.urls[1]),
                      icon: Icon(
                        Icons.code,
                        size: 16,
                        color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                      ),
                      label: Text(
                        'Google Play',
                        style: TextStyle(
                          color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _isHovered
                              ? Colors.transparent
                              : const Color(0xFF2D3E50),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  )

                ],
              ):
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _isHovered
                      ? const Color(0xFF2D3E50).withOpacity (0.9)
                      : Colors.transparent,
                ),
                child: OutlinedButton.icon(
                  onPressed: () =>launchURl(widget.project.urls[0]),
                  icon: Icon(
                    Icons.code,
                    size: 16,
                    color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                  ),
                  label: Text(
                    widget.project.projectType == 'GitHub'? 'GitHub' : 'Website',
                    style: TextStyle(
                      color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: _isHovered
                          ? Colors.transparent
                          : const Color(0xFF2D3E50),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Right side - Placeholder for project image
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB).withOpacity(_isHovered ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: widget.project.imageAsset == null? Icon(
                Icons.image,
                size: 40,
                color: const Color(0xFF3498DB),
              ) : Image.asset(widget.project.imageAsset!,

                //width: 150,
               // height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Placeholder for project image
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF3498DB).withOpacity(_isHovered ? 0.2 : 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: widget.project.imageAsset == null
                ? Icon(
              Icons.image,
              size: 40,
              color: const Color(0xFF3498DB),
            )
                : Image.asset(
              widget.project.imageAsset!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Project details
        Text(
          widget.project.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3E50),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.project.description,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF34495E),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),

        // Technologies
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.project.technologies.map((tech) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF3498DB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF3498DB).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3498DB),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Conditional project type (both GitHub and website)
        widget.project.projectType.contains('Both')
            ? Row(
          children: [
            _buildOutlinedButton(
              'App Store',
              Icons.code,
              widget.project.urls[0],
            ),
            const SizedBox(width: 20),
            _buildOutlinedButton(
              'Google Play',
              Icons.code,
              widget.project.urls[1],
            ),
          ],
        )
            : _buildOutlinedButton(
          widget.project.projectType == 'GitHub' ? 'GitHub' : 'Website',
          Icons.code,
          widget.project.urls[0],
        ),
      ],
    );
  }

// Helper method to build the outlined buttons
  Widget _buildOutlinedButton(
      String label, IconData icon, String url) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _isHovered ? const Color(0xFF2D3E50).withOpacity(0.9) : Colors.transparent,
      ),
      child: OutlinedButton.icon(
        onPressed: () => launchURl(url),
        icon: Icon(
          icon,
          size: 16,
          color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: _isHovered ? Colors.white : const Color(0xFF2D3E50),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: _isHovered ? Colors.transparent : const Color(0xFF2D3E50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  void _openGitHub(String url) {
    debugPrint('Opening URL: $url');
  }
}

class Project {
  final String title;
  final String projectType;
  final String description;
  final List<String> technologies;
  final String? imageAsset;
  final List<String> urls;

  Project({
    required this.title,
    required this.projectType,
    required this.description,
    required this.technologies,
    this.imageAsset,
    required this.urls,
  });
}