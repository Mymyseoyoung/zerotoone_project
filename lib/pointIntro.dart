import 'package:flutter/material.dart';
import 'animalpick.dart'; // animalpick 위젯 파일 임포트

class Pointintro extends StatelessWidget {
  const Pointintro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // 배경 색상을 흰색으로 설정
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // 상단 여백
              // Row를 사용하여 큰 이미지와 오른쪽 이미지 배치
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 큰 이미지
                  Image.asset(
                    'assets/images/point_bigsmall.png',
                    width: size.width * 0.9, // 큰 이미지 크기
                    height: size.width * 0.9,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // 텍스트 섹션
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  children: [
                    Text(
                      '성과가 쭉쭉 올라갈수록\n차곡차곡 적립되는 포인트',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.06,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1.40,
                        letterSpacing: -0.84,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '퀘스트 달성 여부와 성과에 따라\n주어지는 경험치는 포인트로 적립돼요.\n포인트를 사용하여 두몽이를 성장시키고\n깜짝 선물도 얻어가세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF3F3F3F),
                        fontSize: size.width * 0.045,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.60,
                        letterSpacing: -0.56,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // 하단 버튼
              Frame29(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class Frame29 extends StatelessWidget {
  final Size size;

  const Frame29({required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Container(
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.8),
              Colors.white,
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF5C35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onPressed: () {
            // animalpick 위젯으로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AnimalPick()), // AnimalPick으로 이동
            );
          },
          child: Text(
            '나만의 두몽이 만나기',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.045,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 1.40,
              letterSpacing: -0.59,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
