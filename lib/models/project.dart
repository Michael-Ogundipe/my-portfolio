class Project {
  final String name;
  final String description;
  final List<String> imagePaths; // Changed from single imagePath to list
  final List<String> technologies;
  final String demoUrl;
  final String githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.imagePaths, // Updated parameter
    required this.technologies,
    required this.demoUrl,
    required this.githubUrl,
  });
}