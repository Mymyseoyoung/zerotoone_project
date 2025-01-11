import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Welcomepage(),
        ]),
      ),
    );
  }
}

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 29,
                top: 22.67,
                child: Container(
                  width: 332.16,
                  height: 11.56,
                  child: Stack(
                    children: [],
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 450,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '두손꼭',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 5.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Do',
                        style: TextStyle(
                          color: Color(0xFFFF5C35),
                          fontSize: 30,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w800,
                          height: 0,
                          letterSpacing: 0.60,
                        ),
                      ),
                      TextSpan(
                        text: '전!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'apple',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 4.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                  left: 117,
                  top: 288,
                  child: Container(
                    child: Image.asset('assets/images/first_page_logo.png'),
                  )),
              Positioned(
                left: 75,
                top: 497,
                child: Text(
                  '도전은 즐겁게  ,  성과는 확실하게',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF5C35),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.48,
                  ),
                ),
              ),
              Positioned(
                left: 266,
                top: 830,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(3.14),
                  child: Container(
                    width: 139,
                    height: 5,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
