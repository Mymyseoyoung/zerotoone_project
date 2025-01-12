import 'package:flutter/material.dart';

class Pointintro extends StatelessWidget {
  const Pointintro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 388,
          height: 541,
          padding: const EdgeInsets.only(top: 296, left: 63, bottom: 61),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 수정된 부분: 이미지 추가
              Column(
                children: [
                  Image.asset(
                    'assets/images/point_big.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16), // 이미지 간 간격
                  Image.asset(
                    'assets/images/point_small.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '성과가 쭉쭉 올라갈수록\n차곡차곡 적립되는 포인트',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1.40,
                        letterSpacing: -0.84,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 388,
                      child: Text(
                        '퀘스트 달성 여부와 성과에 따라\n주어지는 경험치는 포인트로 적립돼요\n포인트를 사용하여 두몽이를 성장시키고\n깜짝 선물도 얻어가세요!',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.60,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Frame29 extends StatelessWidget {
  final Size size;

  const Frame29({required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        width: size.width,
        height: size.height * 0.1,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: size.height * 0.02,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Colors.white.withOpacity(0),
              Colors.white.withOpacity(0.53),
              Colors.white
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF5C35), // 수정된 부분
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onPressed: () {
            // 버튼 동작 추가
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
