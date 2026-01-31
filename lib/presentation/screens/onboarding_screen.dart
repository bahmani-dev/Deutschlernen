import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/langauge_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Learn a langauge\nfor free",
      description: "Learn German language with fun, bite-sized lessons",
      imagePath: "assets/images/onboarding3.jpg",
    ),
    OnboardingPage(
      title: "Personalized\nLearning",
      description: "Best tactics lessons adapt to your learning style and pace",
      imagePath: "assets/images/onboarding1.jpg",
    ),
    OnboardingPage(
      title: "Stay Motivated\nwith Streaks",
      description: "Build a daily habit and track your progress with friends",
      imagePath: "assets/images/onboarding2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPageWidget(page: _pages[index]);
            },
          ),
          //Skip
          if (_currentPage < _pages.length - 1)
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,

              right: 20,
              child: TextButton(
                onPressed: () {
                  _pageController.jumpToPage(_pages.length - 1);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 23,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _currentPage == _pages.length - 1
                      ? _buildGetStartedButton()
                      : _buildNextButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        elevation: 0,
      ),
      child: Text(
        'Continue',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboarding_complete', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LanguageSelectionScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            minimumSize: Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            elevation: 0,
            side: BorderSide(color: Color(0xff58cc02)),
          ),
          child: Text("Get Started"),
        ),
        SizedBox(height: 1),
        TextButton(
          onPressed: () {},
          child: Text(
            "I already have an account",
            style: TextStyle(color: Color(0xff1cf6b0)),
          ),
        ),
      ],
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xff1cb0f6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff1cb0f6),
            ),
            child: Icon(Icons.school_outlined, size: 150, color: Colors.white),
          ),
          SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              page.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
