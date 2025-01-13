import 'package:flutter/material.dart';
import 'mbti4.dart';

class Mbti3 extends StatefulWidget {
  const Mbti3({Key? key}) : super(key: key);

  @override
  _MBTIState createState() => _MBTIState();
}

class _MBTIState extends State<Mbti3> {
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
                '몇 주에 걸쳐 준비한 프로젝트의 \n발표를 담당하게 됐습니다. \n발표 3시간 전 어떤 생각이 있을까요요?',
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
                        MaterialPageRoute(builder: (context) => const Mbti4()),
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
                        '나가면서 선에 걸려 넘어지면 어떡하지? \n만약에 말실수를 한다면 어떻게 되는 걸까?',
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
                        MaterialPageRoute(builder: (context) => const Mbti4()),
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
                        '내가 가장 헷갈렸던 부분이 어디더라? \n떨지 말고 그 부분 다시 확인해야겠다.',
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
            width: 85.5,
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
