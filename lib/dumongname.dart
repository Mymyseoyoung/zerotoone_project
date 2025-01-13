import 'package:flutter/material.dart';
import 'eggpick.dart'; // eggpick.dart 임포트

class Dumongname extends StatefulWidget {
  @override
  _DumongnameState createState() => _DumongnameState();
}

class _DumongnameState extends State<Dumongname> {
  bool isButtonPressed = false; // 버튼 상태를 관리
  bool isTextFieldFocused = false; // 텍스트 필드 포커스 상태 관리
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // 뒤로가기
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '두몽이의 이름을 지어주세요',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '앞으로 회사 생활을 함께할 나의 두몽이의 이름을 지어주세요!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/wavinghand.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Focus(
                          onFocusChange: (hasFocus) {
                            setState(() {
                              isTextFieldFocused = hasFocus;
                            });
                          },
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: '두몽이 이름',
                              hintStyle: TextStyle(
                                color: Color(0xFFB0B0B0), // 옅은 회색
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              filled: true,
                              fillColor: Color(0xFFFFF5F5), // 배경색 설정
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.transparent, // 기본 테두리는 투명
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5C35), // 포커스 시 테두리 색상
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonPressed = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EggPick()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonPressed
                        ? Color(0xFFFF5C35)
                        : Colors.white, // 기본 배경 흰색
                    side: BorderSide(
                      color: isButtonPressed
                          ? Colors.transparent
                          : Color(0xFFB0B0B0), // 테두리 색상
                      width: 2,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '두근두근 두몽이 탄생!',
                    style: TextStyle(
                      color: isButtonPressed
                          ? Colors.white
                          : Color(0xFFB0B0B0), // 글씨 색상
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
