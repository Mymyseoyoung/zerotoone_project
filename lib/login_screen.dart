import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // 텍스트 필드 컨트롤러
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // FocusNode를 통해 텍스트 필드에 포커스를 줄 수 있습니다
  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // FocusNode의 상태 변화 감지
    _idFocusNode.addListener(() {
      setState(() {}); // 상태 변화 시 화면 갱신
    });
    _passwordFocusNode.addListener(() {
      setState(() {}); // 상태 변화 시 화면 갱신
    });
  }

  @override
  void dispose() {
    // 위젯이 사라질 때 FocusNode도 해제해줍니다
    _idFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // SingleChildScrollView로 감싸서 스크롤 가능하게
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.white,
          child: Column(
            children: [
              // 로고
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: Center(
                  child: Image.asset(
                    'assets/images/dohands_logo.png',
                    width: screenWidth * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // 안내 텍스트
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.05,
                ),
                child: Text(
                  '회원 서비스 이용을 위해 로그인 해주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF414141),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
              // 아이디 입력 필드
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFF7F5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: _idFocusNode.hasFocus
                            ? Color(0xFFFF5C35)
                            : Colors.grey, // 선택 상태에 따라 색상 변경
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _idController,
                    focusNode: _idFocusNode,
                    decoration: InputDecoration(
                      hintText: '아이디',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
              ),
              // 비밀번호 입력 필드
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFF8F6),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: _passwordFocusNode.hasFocus
                            ? Color(0xFFFF5C35)
                            : Colors.grey, // 선택 상태에 따라 색상 변경
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      hintText: '비밀번호',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
              ),
              // 로그인 버튼
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF5C35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFFFFDFD6),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        final id = _idController.text;
                        final password = _passwordController.text;
                        print('아이디: $id, 비밀번호: $password');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextScreen(), // 이동할 화면
                          ),
                        );
                      },
                      child: Text(
                        '로그인하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Pretendard',
                        ),
                      ),
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

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('다음 화면')),
      body: Center(child: Text('다음 화면입니다!')),
    );
  }
}
