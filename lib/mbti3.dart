import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart'; // MbtiProvider import 추가
import 'mbti4.dart'; // Mbti4 import 추가
import 'mbti2.dart'; // Mbti2 import 추가

class Mbti3 extends StatelessWidget {
  const Mbti3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mbtiProvider = Provider.of<MbtiProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                '나의 성향은?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.80,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '두몽이의 성격에 반영되어요',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                  letterSpacing: -0.50,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '몇 주에 걸쳐 준비한 프로젝트의\n발표를 담당하게 됐습니다.\n발표 3시간 전 어떤 생각이 있을까요?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.40,
                  letterSpacing: -0.70,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '3 / 4',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.31,
                  letterSpacing: -0.50,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti2()),
                      );
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF3F4F6),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFB0B0B0),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Rectangle4439(),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/thinking-face.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  // 첫 번째 선택지
                  GestureDetector(
                    onTap: () {
                      mbtiProvider.setAnswer(3, 'a'); // 선택값 'a' 저장
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti4()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer3 == 'a',
                      text: '내가 가장 헷갈렸던 부분이 어디더라?\n떨지 말고 그 부분 다시 확인해야겠다.',
                    ),
                  ),
                  const SizedBox(height: 29),
                  // 두 번째 선택지
                  GestureDetector(
                    onTap: () {
                      mbtiProvider.setAnswer(3, 'b'); // 선택값 'b' 저장
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti4()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer3 == 'b',
                      text: '내가면서 선에 걸려 넘어지면 어떡하지?\n만약에 말실수를 한다면 어떻게 되는 걸까?',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class Rectangle4439 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 114,
          height: 4,
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F4F6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: 85.5, // 진행 상태에 맞춘 너비 설정
            height: 4,
            decoration: ShapeDecoration(
              color: const Color(0xFFFF5C35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OptionContainer extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _OptionContainer({
    Key? key,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F5),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF5C35) : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          height: 1.40,
          letterSpacing: -0.56,
        ),
      ),
    );
  }
}
