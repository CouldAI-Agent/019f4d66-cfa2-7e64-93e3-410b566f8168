import 'package:flutter/material.dart';

void main() {
  runApp(const MyWebsiteApp());
}

class MyWebsiteApp extends StatelessWidget {
  const MyWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default fallback, but customizable
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BrandName',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        actions: _buildAppBarActions(context),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const FeaturesSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;
    if (!isDesktop) {
      return [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open mobile menu or drawer
          },
        ),
      ];
    }
    return [
      TextButton(onPressed: () {}, child: const Text('Home')),
      const SizedBox(width: 8),
      TextButton(onPressed: () {}, child: const Text('Features')),
      const SizedBox(width: 8),
      TextButton(onPressed: () {}, child: const Text('Pricing')),
      const SizedBox(width: 16),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        child: const Text('Get Started'),
      ),
      const SizedBox(width: 24),
    ];
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120.0 : 24.0,
        vertical: isDesktop ? 100.0 : 60.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Build the Future Together',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 600,
            child: Text(
              'A modern, responsive website built with Flutter. Fast, beautiful, and natively compiled for mobile, web, and desktop from a single codebase.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                  ),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Start for free'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Learn more'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > 800;
        final isTablet = screenWidth > 600 && screenWidth <= 800;
        
        int crossAxisCount = 1;
        if (isDesktop) crossAxisCount = 3;
        if (isTablet) crossAxisCount = 2;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 120.0 : 24.0,
            vertical: 80.0,
          ),
          child: Column(
            children: [
              Text(
                'Why Choose Us',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover the features that make our platform unique.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 60),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 32,
                crossAxisSpacing: 32,
                childAspectRatio: isDesktop ? 1.2 : (isTablet ? 1.0 : 1.5),
                children: const [
                  FeatureCard(
                    icon: Icons.speed,
                    title: 'Lightning Fast',
                    description: 'Optimized for speed, giving you the best performance possible across all devices.',
                  ),
                  FeatureCard(
                    icon: Icons.security,
                    title: 'Secure by Default',
                    description: 'Built with modern security practices to keep your data safe and protected.',
                  ),
                  FeatureCard(
                    icon: Icons.phone_android,
                    title: 'Fully Responsive',
                    description: 'Looks great on any screen size. Seamless experience from mobile to desktop.',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          const Text(
            'BrandName',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('About', style: TextStyle(color: Colors.white70)),
              SizedBox(width: 24),
              Text('Privacy Policy', style: TextStyle(color: Colors.white70)),
              SizedBox(width: 24),
              Text('Terms of Service', style: TextStyle(color: Colors.white70)),
              SizedBox(width: 24),
              Text('Contact', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            '© ${DateTime.now().year} BrandName. All rights reserved.',
            style: const TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
