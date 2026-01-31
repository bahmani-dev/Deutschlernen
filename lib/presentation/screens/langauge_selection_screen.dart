import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;
  String? _selectedTargetLangugae;

  final List<Map<String, dynamic>> _languages = [
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'fa', 'name': "Persian", 'flag': '🇦🇫'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Language",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildLanguageSection(
              title: "I Know",
              selectedLanguage: _selectedLanguage,
              onTap: (language) {
                setState(() {
                  _selectedLanguage = language;
                });
              },
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: _selectedLanguage != null
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff58cc02),
                foregroundColor: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection({
    required String title,
    required String? selectedLanguage,
    required Function(String) onTap,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _languages.map<Widget>((language) {
            final isSelected = selectedLanguage == language['code'];
            return GestureDetector(
              onTap: () => onTap(language['code'] as String),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xff58cc02) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xff58cc02) : Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      language['flag'] as String,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 8),
                    Text(
                      language['name'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
