import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart'; // MbtiProvider import 추가
import 'dumongname.dart'; // Dumongname import 추가
import 'mbti3.dart'; // Mbti3 import 추가

class Mbti4 extends StatelessWidget {
  const Mbti4({Key? key}) : super(key: key);

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
                '업무를 진행하던 당신에게 갑작스럽게\n당신을 찾는 고객과의 미팅이 마련됩니다.\n이때 당신은 무슨 생각을 할까요?',
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
                '4 / 4',
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
                        MaterialPageRoute(builder: (context) => const Mbti3()),
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
                      mbtiProvider.setAnswer(4, 'a'); // 선택값 'a' 저장
                      mbtiProvider.calculateMbti(); // 마지막에 MBTI 계산
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dumongname()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer4 == 'a',
                      text: '윽윽! 저 미팅 때문에 오늘 계획해둔\n모든 업무가 망가질 거야.. 너무 싫어!',
                    ),
                  ),
                  const SizedBox(height: 29),
                  // 두 번째 선택지
                  GestureDetector(
                    onTap: () {
                      mbtiProvider.setAnswer(4, 'b'); // 선택값 'b' 저장
                      mbtiProvider.calculateMbti(); // 마지막에 MBTI 계산
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dumongname()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer4 == 'b',
                      text:
                          '더 좋은 기회가 생기는거니까 완전 럭키비키키잖아?\n오늘 할 일은 내일 해도 되니까.. 미팅 수락!',
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
            width: 114, // 진행 상태에 맞춘 너비 설정
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
