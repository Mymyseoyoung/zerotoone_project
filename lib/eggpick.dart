import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart';

class EggPick extends StatelessWidget {
  const EggPick({super.key});

  @override
  Widget build(BuildContext context) {
    final mbtiProvider =
        Provider.of<MbtiProvider>(context, listen: true); // Provider로 상태 가져오기

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // MBTI 유형과 "두몽이" 출력
            Text(
              mbtiProvider.eggType, // 예: 열정넘치는 인싸
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.40,
                letterSpacing: -0.24,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '“두몽이”',
              style: TextStyle(
                color: Color(0xFFFF5C35),
                fontSize: 32,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.40,
                letterSpacing: -0.32,
              ),
            ),
            const SizedBox(height: 16),
            // 안내 문구
            const Text(
              '지금 알을 획득하여 \n두몽이와 함께 성장해가요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Gothic A1',
                fontWeight: FontWeight.w500,
                height: 1.50,
                letterSpacing: -0.13,
              ),
            ),
            const SizedBox(height: 20),
            // 알 이미지 출력
            Container(
              width: 232,
              height: 232,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(mbtiProvider.eggImage), // Provider에서 이미지 가져오기
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 손가락 버튼
            GestureDetector(
              onTap: () {
                // 클릭 시 행동 추가
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Text('알을 수확했어요!'),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 86,
                    height: 87,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/finger.png'), // 손가락 이미지
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '클릭하여 수확하기',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
