import 'cards.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('Assets/Images/Mask group.png'),
              ),
            ),
          ),
        ],
        leading: Icon(Icons.grid_view_rounded, color: Colors.brown, size: 28),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 200,

              child: Text(
                'Find the best',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            Container(
              child: Text(
                textAlign: TextAlign.right,
                '    Coffee to your taste',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  _buildSearchBar() {
    return Row(children: [Expanded(child: TextField())]);
  }
}
