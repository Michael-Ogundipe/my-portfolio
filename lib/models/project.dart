class Project {
  final String name;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String demoUrl;
  final String githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.technologies,
    required this.demoUrl,
    required this.githubUrl,
  });
}