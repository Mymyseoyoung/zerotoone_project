import 'package:flutter/material.dart';
import 'gsheet_service.dart'; // Google Sheets 데이터 가져오기

import 'dumongintro.dart'; // 로그인 성공 후 이동할 화면

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

  bool _isLoading = false; // 로딩 상태 관리

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

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Google Sheets에서 사용자 정보 가져오기
      final users = await GSheetService.fetchUsers();
      final id = _idController.text.trim();
      final password = _passwordController.text.trim();

      if (users.containsKey(id) && users[id] == password) {
        // 로그인 성공
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DumongIntro()),
        );
      } else {
        // 로그인 실패
        showSnackBar(context, '아이디나 비밀번호가 일치하지 않습니다.');
      }
    } catch (e) {
      showSnackBar(context, '데이터를 가져오는 데 실패했습니다. $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                    _buildTextField(
                      controller: _idController,
                      focusNode: _idFocusNode,
                      hintText: '아이디',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    // 비밀번호 입력 필드
                    _buildTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: '비밀번호',
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      obscureText: true,
                    ),
                    // 로그인 버튼
                    Spacer(),
                    _buildLoginButton(screenWidth, screenHeight),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required double screenWidth,
    required double screenHeight,
    bool obscureText = false,
  }) {
    return Padding(
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
              color: focusNode.hasFocus ? Color(0xFFFF5C35) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          obscureText: obscureText,
          style: TextStyle(
            color: Color(0xFF616161),
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pretendard',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
            onTap: _isLoading ? null : _login,
            child: _isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
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
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
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
}
