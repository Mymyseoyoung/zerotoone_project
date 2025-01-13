import 'package:flutter/material.dart';

class Dumongname extends StatefulWidget {
  @override
  _DumongnameState createState() => _DumongnameState();
}

class _DumongnameState extends State<Dumongname> {
  bool isFocused = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.9,
              height: 57,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Color(0xFFAEAEAE)),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '두근두근 두몽이 탄생!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF696969),
                fontSize: 17,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.40,
                letterSpacing: -0.59,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '앞으로 회사 생활을 함께할 \n나의 두몽이의 이름을 지어주세요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1.50,
                letterSpacing: -0.50,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '두몽이 이름',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFFF5C35), width: 2),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 1.40,
                letterSpacing: -0.56,
              ),
              onTap: () {
                setState(() {
                  isFocused = true;
                });
              },
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
          ],
        ),
      ),
    );
  }
}
