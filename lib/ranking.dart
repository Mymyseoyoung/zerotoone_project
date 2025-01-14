import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define relative sizes
    double widthFactor(double factor) => screenWidth * factor;
    double heightFactor(double factor) => screenHeight * factor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // White Background Container
            Container(
              width: screenWidth,
              height: heightFactor(0.95), // Adjust as needed
              color: Colors.white,
            ),
            // Main Content Container
            Container(
              width: widthFactor(0.85), // 85% of screen width
              padding: const EdgeInsets.only(bottom: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Inner Column
                  Container(
                    width: widthFactor(0.89), // 89% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Container
                        Container(
                          width: widthFactor(0.87), // 87% of screen width
                          height: heightFactor(0.1), // Adjust as needed
                          decoration: BoxDecoration(
                            color: Color(0xFFFFCCC0),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Oval Container
                        Container(
                          width: 48,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFFF5C35)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Rotated Line
                        Transform.rotate(
                          angle: 1.57, // 90 degrees in radians
                          child: Container(
                            width: 40,
                            height: 1, // Thickness of the line
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Text Elements
                        Center(
                          child: Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFFFF8F74),
                                  fontSize: 32,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '김지수',
                                style: TextStyle(
                                  color: Color(0xFFFF5C35),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '44,500 EXP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '음성 1센터',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Badge Container
                        Container(
                          width: 48,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF5C35),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'jisookim',
                          style: TextStyle(
                            color: Color(0xFF656565),
                            fontSize: 6,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Lv. F2-Ⅱ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Status Indicators
                        StatusIndicators(),
                        SizedBox(height: 10),
                        // Profile Image
                        ProfileImage(),
                        SizedBox(height: 10),
                        // Additional Containers and Texts...
                        // Repeat similar structures for other ranking entries
                        // For brevity, only a few entries are shown here

                        // Example Ranking Entry
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '허재민',
                          points: '44,500',
                          level: 'Lv. F2-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '조선우',
                          points: '27,690',
                          level: 'Lv. F2-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '양소영',
                          points: '20,000',
                          level: 'Lv. F1-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '성주현',
                          points: '13,523',
                          level: 'Lv. F1-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '김민수',
                          points: '12,657',
                          level: 'Lv. F1-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        RankingEntry(
                          imagePath: 'assets/images/profile_placeholder.png',
                          name: '심유나',
                          points: '10,500',
                          level: 'Lv. F1-Ⅱ',
                        ),
                        SizedBox(height: 10),
                        // Gradient Container
                        Container(
                          width: screenWidth,
                          height: 114,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.white.withOpacity(0.53),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Divider
                        Divider(
                          color: Color(0xFFFF5C35),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Navigation Replacement with Row
            BottomNavigation(),
          ],
        ),
      ),
    );
  }
}

// Widget for Status Indicators
class StatusIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First Indicator
        Column(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFFFFD12E),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFFBE9401),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xFFFFD12E),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xFFFFD12E),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xFFBE9401),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xFFBE9401),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        // Add more indicators or widgets here if needed
      ],
    );
  }
}

// Widget for Profile Image
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/profile_placeholder.png"),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

// Widget for Ranking Entry
class RankingEntry extends StatelessWidget {
  final String imagePath;
  final String name;
  final String points;
  final String level;

  RankingEntry({
    required this.imagePath,
    required this.name,
    required this.points,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adjust width based on screen if needed
      child: Row(
        children: [
          // Profile Picture with Border
          Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Color(0xFFFF5C35)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          // Name and Points
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                points,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                level,
                style: TextStyle(
                  color: Color(0xFFFF5C35),
                  fontSize: 8,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          // Badge or Additional Info
          Container(
            width: 22,
            height: 21,
            decoration: BoxDecoration(
              color: Color(0xFFFF5C35),
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for Bottom Navigation
class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.84, // 84% of screen width
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Example Dot Indicator
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFFFF5C35),
              shape: BoxShape.circle,
            ),
          ),
          // Notification Icon
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFFFF5C35)),
            onPressed: () {
              // Handle notification tap
            },
          ),
          // Additional Icons or Buttons
          IconButton(
            icon: Icon(Icons.settings, color: Color(0xFFFF5C35)),
            onPressed: () {
              // Handle settings tap
            },
          ),
        ],
      ),
    );
  }
}
