import 'package:flutter/material.dart';
import 'DumongIntro.dart';

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
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _idFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _idFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
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
                                  : Colors.grey,
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
                                  : Colors.grey,
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
                    Spacer(),
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
                              final validCredentials = {
                                "minsukim": "1111",
                                "jaminheo": "1111",
                                "juhyeonsung": "1111",
                                "seonwoocho": "1111",
                                "yoonasim": "1111",
                                "soyoungeyang": "1111",
                                "jisookim": "1111",
                              };

                              if (validCredentials.containsKey(id) &&
                                  validCredentials[id] == password) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DumongIntro(),
                                  ),
                                );
                              } else {
                                showSnackBar(context);
                              }
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
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '아이디나 비밀번호가 일치하지 않습니다',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w300,
        fontFamily: 'Pretendard',
      ),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: const Color.fromARGB(187, 62, 61, 61),
  ));
}
