import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Stack(
          children: [
            // 로고
            Positioned(
              left: screenWidth * 0.3, // 화면 너비의 30%
              top: screenHeight * 0.1, // 화면 높이의 10%
              child: Image.asset(
                'assets/images/dohands_logo.png', // 로고 이미지 경로
                width: screenWidth * 0.4, // 화면 너비의 40%
                fit: BoxFit.contain,
              ),
            ),

            // 안내 텍스트
            Positioned(
              left: screenWidth * 0.05, // 화면 너비의 5%
              top: screenHeight * 0.28, // 화면 높이의 28%
              child: Container(
                width: screenWidth * 0.9, // 화면 너비의 90%
                child: Text(
                  '회원 서비스 이용을 위해 로그인 해주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF414141),
                    fontSize: screenWidth * 0.04, // 화면 너비 기준 폰트 크기
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ),

            // 아이디 입력 필드
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.35,
              child: Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.05,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFFFF7F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '아이디',
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ),

            // 비밀번호 입력 필드
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.45,
              child: Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.05,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFFFF8F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ),

            // 로그인 버튼
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.55,
              child: Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFFF5C35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFFFDFD6),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '로그인하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
