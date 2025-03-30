

import '../models/project.dart';

List<Project> projects = [
  Project(
    name: 'Gemilingo',
    description: 'AI-powered translation app that provides real-time translations with context awareness using Gemini AI.',
    imagePath: 'assets/images/project1.png',
    technologies: ['Flutter', 'Gemini AI', 'Firebase', 'Riverpod'],
    demoUrl: 'https://example.com/gemilingo',
    githubUrl: 'https://github.com/yourusername/gemilingo',
  ),
  Project(
    name: 'TaskFlow',
    description: 'Productivity app with task management, time tracking, and analytics to help users optimize their workflow.',
    imagePath: 'assets/images/project2.png',
    technologies: ['Flutter', 'Firebase', 'BLoC', 'Hive'],
    demoUrl: 'https://example.com/taskflow',
    githubUrl: 'https://github.com/yourusername/taskflow',
  ),
  Project(
    name: 'HealthTrack',
    description: 'Fitness and nutrition app that tracks workouts, meals, and provides personalized recommendations.',
    imagePath: 'assets/images/project3.png',
    technologies: ['Flutter', 'Node.js', 'MongoDB', 'Provider'],
    demoUrl: 'https://example.com/healthtrack',
    githubUrl: 'https://github.com/yourusername/healthtrack',
  ),
];