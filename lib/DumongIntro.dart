import 'package:flutter/material.dart';

class DumongIntro extends StatelessWidget {
  const DumongIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.04, // 전체를 아래로 내리기 위해 값 증가
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '사랑스러운\n두몽이 키우기!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF292927),
                            fontSize: size.width * 0.07,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.98,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '성과와 함께 성장하는 두몽이',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF5C35),
                            fontSize: size.width * 0.05,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.70,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 44),
                    Center(
                      child: Container(
                        width: size.width * 0.7,
                        height: size.width * 0.7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/dumong.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    '나의 성향을 반영한\n나만의 귀여운 캐릭터로 탄생',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.06,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                      letterSpacing: -0.84,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    '아기 동물이 성장한 모습이 궁금하지 않나요?\n보람찬 업무 달성 과정을 통해\n아기 동물과 함께 성장해보세요!',
                    style: TextStyle(
                      color: Color(0xFF3F3F3F),
                      fontSize: size.width * 0.045,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                      letterSpacing: -0.59,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Frame29(size: size),
        ],
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
