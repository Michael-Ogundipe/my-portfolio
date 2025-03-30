import 'package:flutter/material.dart';

class ArticlesSection extends StatefulWidget {
  const ArticlesSection({Key? key}) : super(key: key);

  @override
  State<ArticlesSection> createState() => _ArticlesSectionState();
}

class _ArticlesSectionState extends State<ArticlesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _slideAnimation;

  final List<Article> _articles = [
    Article(
      title: 'Building Responsive UIs with Flutter',
      date: 'March 15, 2024',
      summary: 'Learn how to create adaptive layouts that work across all screen sizes using Flutter\'s powerful layout system. This article covers MediaQuery, LayoutBuilder, and responsive design patterns.',
      category: 'UI/UX',
      readTime: '5 min read',
      imageAsset: 'assets/responsive_ui.jpg',
      url: 'https://yourblog.com/responsive-ui-flutter',
    ),
    Article(
      title: 'State Management Patterns in Flutter',
      date: 'February 28, 2024',
      summary: 'A comprehensive comparison of Provider, Bloc, and Riverpod for managing state in medium to large Flutter applications. Includes performance benchmarks and use case recommendations.',
      category: 'Architecture',
      readTime: '7 min read',
      imageAsset: 'assets/state_management.jpg',
      url: 'https://yourblog.com/state-management-flutter',
    ),
    Article(
      title: 'Animations in Flutter: Beyond the Basics',
      date: 'January 10, 2024',
      summary: 'Take your Flutter animations to the next level with custom curved animations, hero transitions, and interactive gestures. Includes practical examples and performance tips.',
      category: 'Animation',
      readTime: '6 min read',
      imageAsset: 'assets/animations.jpg',
      url: 'https://yourblog.com/advanced-flutter-animations',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
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
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header with Animation
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: child,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      color: Colors.blue[800],
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Featured Articles',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'My latest writings on Flutter development',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Articles List - One per row
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _articles.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              // Staggered animation for each article
              final animationDelay = 0.3 + (index * 0.15);
              final animation = CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  animationDelay,
                  animationDelay + 0.5,
                  curve: Curves.easeOut,
                ),
              );

              return AnimatedArticleCard(
                article: _articles[index],
                animation: animation,
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedArticleCard extends StatefulWidget {
  final Article article;
  final Animation<double> animation;
  final bool isMobile;

  const AnimatedArticleCard({
    Key? key,
    required this.article,
    required this.animation,
    required this.isMobile,
  }) : super(key: key);

  @override
  State<AnimatedArticleCard> createState() => _AnimatedArticleCardState();
}

class _AnimatedArticleCardState extends State<AnimatedArticleCard> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - widget.animation.value)),
          child: Opacity(
            opacity: widget.animation.value,
            child: child,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() {
          _isHovered = false;
          _isTapped = false;
        }),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isTapped = true),
          onTapUp: (_) => setState(() => _isTapped = false),
          onTapCancel: () => setState(() => _isTapped = false),
          onTap: () => _openArticle(context, widget.article.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()
              ..scale(_isTapped ? 0.98 : 1.0)
              ..translate(
                _isHovered ? -2.0 : 0.0,
                _isHovered ? -2.0 : 0.0,
              ),
            child: Card(
              elevation: _isHovered ? 8 : 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[50]!,
                      Colors.white,
                    ],
                  ),
                  border: Border.all(
                    color: _isHovered
                        ? Colors.blue[300]!.withOpacity(0.5)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Stack(
                  children: [
                    // Article content
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Article Image
                        if (!widget.isMobile) ...[
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                            ),
                            child: Icon(
                              Icons.article,
                              size: 60,
                              color: Colors.blue[300],
                            ),
                          ),
                        ],

                        // Article Content
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(widget.isMobile ? 16 : 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Category and Date
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[800],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.article.category,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.article.date,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),

                                // Title
                                Text(
                                  widget.article.title,
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 18 : 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Summary
                                Text(
                                  widget.article.summary,
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 14 : 16,
                                    color: Colors.grey[800],
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Read More and Time
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Read Time
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          widget.article.readTime,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Read More Button
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _isHovered
                                            ? Colors.blue[600]
                                            : Colors.blue[800],
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: _isHovered
                                            ? [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          )
                                        ]
                                            : null,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Read Article',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          AnimatedRotation(
                                            duration: const Duration(milliseconds: 200),
                                            turns: _isHovered ? 0.1 : 0,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Hover overlay effect
                    if (_isHovered)
                      Container(
                        color: Colors.white.withOpacity(0.1),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openArticle(BuildContext context, String url) {
    // In a real app, you would use url_launcher here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $url'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class Article {
  final String title;
  final String date;
  final String summary;
  final String category;
  final String readTime;
  final String? imageAsset;
  final String url;

  Article({
    required this.title,
    required this.date,
    required this.summary,
    required this.category,
    required this.readTime,
    this.imageAsset,
    required this.url,
  });
}