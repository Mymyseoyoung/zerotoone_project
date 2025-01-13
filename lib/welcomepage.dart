import 'package:flutter/material.dart';
import 'login_screen.dart'; // 로그인 화면 import

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  WelcomepageState createState() => WelcomepageState();
}

class WelcomepageState extends State<Welcomepage> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 로그인 화면으로 이동
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 로고 이미지 중앙 정렬
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.15), // 화면 상단에서 15% 아래로 배치
              child: Image.asset(
                'assets/images/first_page_logo.png',
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                fit: BoxFit.contain,
              ),
            ),
            // 텍스트 "두손꼭 Do전!"
            Column(
              children: [
                // 두손꼭 Do전! 텍스트와 로고 간격 조정
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '두손꼭',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.08,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 5.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Do',
                        style: TextStyle(
                          color: const Color(0xFFFF5C35),
                          fontSize: screenWidth * 0.08,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.60,
                        ),
                      ),
                      TextSpan(
                        text: '전!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.08,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 4.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                // 서브 텍스트 "도전은 즐겁게, 성과는 확실하게"와 간격 조정
                Padding(
                  padding:
                      EdgeInsets.only(top: screenHeight * 0.02), // 텍스트 간격 조정
                  child: Text(
                    '도전은 즐겁게  ,  성과는 확실하게',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFF5C35),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
