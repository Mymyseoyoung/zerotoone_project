import 'package:flutter/material.dart';
import 'mbti3.dart';

class Mbti2 extends StatefulWidget {
  const Mbti2({Key? key}) : super(key: key);

  @override
  _MBTIState createState() => _MBTIState();
}

class _MBTIState extends State<Mbti2> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
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
              Text(
                '동료가 열심히 해도 성과가 \n안 난다며 고민 상담을 시작합니다. \n고민을 들은 당신은 어떤 답변을 줄까요요?',
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
                '2 / 4',
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
              Rectangle4439(),
              const SizedBox(height: 16),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 0;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti3()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7F5),
                        border: Border.all(
                          color: selectedOption == 0
                              ? const Color(0xFFFF5C35)
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '계획을 짜고 성과를 기록해 보는 건 어떨까요? \n어느 부분에서 부족했는지 알 수 있을 거예요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 1;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Mbti3()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 53, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8F6),
                        border: Border.all(
                          color: selectedOption == 1
                              ? const Color(0xFFFF5C35)
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '열심히 하는데 안 풀리는 것만큼 속상한 게 없죠..ㅠ \n누구보다 열심히 하시니 꼭 웃을 날이 올 거예요!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: -0.56,
                        ),
                      ),
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
            color: Color(0xFFF3F4F6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: 57.0,
            height: 4,
            decoration: ShapeDecoration(
              color: Color(0xFFFF5C35),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ),
      ],
    );
  }
}
