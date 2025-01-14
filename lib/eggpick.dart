import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart';
import 'ranking.dart'; // Import the Ranking screen

class EggPick extends StatelessWidget {
  const EggPick({super.key});

  @override
  Widget build(BuildContext context) {
    final mbtiProvider = Provider.of<MbtiProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MBTI 유형 (eggType)
                Text(
                  mbtiProvider.eggType.isEmpty
                      ? '알 타입을 확인할 수 없어요'
                      : mbtiProvider.eggType,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),

                // "두몽이" 이름
                Text(
                  mbtiProvider.dumongName.isEmpty
                      ? '“두몽이”'
                      : '“${mbtiProvider.dumongName}”',
                  style: const TextStyle(
                    color: Color(0xFFFF5C35),
                    fontSize: 32,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),

                // 안내 문구
                const Text(
                  '지금 알을 획득하여\n두몽이와 함께 성장해가요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Gothic A1',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                // 알 이미지
                mbtiProvider.eggImage.isNotEmpty
                    ? SizedBox(
                        width: 232,
                        height: 232,
                        child: Image.asset(
                          mbtiProvider.eggImage,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const SizedBox(
                        width: 232,
                        height: 232,
                        child: Center(
                          child: Text('알 이미지가 없어요'),
                        ),
                      ),
                const SizedBox(height: 40),

                // 손가락 버튼
                GestureDetector(
                  onTap: () {
                    // 클릭 시 AlertDialog 띄우기
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        alignment: Alignment.center, // 메시지를 화면 중간에 배치
                        content: const Text(
                          '알을 수확했어요!',
                          textAlign: TextAlign.center, // 텍스트 정렬
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Pretendard',
                            color: Colors.black,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // 둥근 테두리
                        ),
                        backgroundColor: Colors.white,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // 다이얼로그 닫기
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RankingScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              '확인',
                              style: TextStyle(
                                color: Color(0xFFFF5C35), // 원하는 색상으로 설정
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 86,
                        height: 87,
                        child: Image.asset(
                          'assets/images/finger.png',
                          fit: BoxFit.fill,
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
