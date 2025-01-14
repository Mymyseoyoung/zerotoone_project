import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart'; // MbtiProvider import 추가
import 'animalpick.dart'; // AnimalPick import 추가
import 'mbti2.dart';

class Mbti1 extends StatelessWidget {
  const Mbti1({Key? key}) : super(key: key);

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
                '내일은 드디어 주말..! \n일주일 동안 기다리고 기다리던 주말에 \n당신은 어떤 하루를 보낼 건가요?',
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
              const SizedBox(height: 16),
              const Text(
                '1 / 4',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 1.31,
                  letterSpacing: -0.50,
                ),
              ),
              const SizedBox(height: 16),
              // 뒤로가기 버튼과 진행 바
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimalPick()),
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
                      mbtiProvider.setAnswer(1, 'a'); // 'a' 저장
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti2()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer1 == 'a',
                      text: '집 밖으로 한 발자국도 안 나가야지!\n이번에 새로 나온 넷플릭스 보면서 뭐 시켜 먹지?',
                    ),
                  ),
                  const SizedBox(height: 29),
                  // 두 번째 선택지
                  GestureDetector(
                    onTap: () {
                      mbtiProvider.setAnswer(1, 'b'); // 'b' 저장
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti2()),
                      );
                    },
                    child: _OptionContainer(
                      isSelected: mbtiProvider.answer1 == 'b',
                      text: '당장 친구들한테 연락해야겠다.\n어디 쪽으로 나가면 좋을까, 홍대? 성수?',
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
            width: 28.50,
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
