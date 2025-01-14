import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart';
import 'eggpick.dart';

class Dumongname extends StatefulWidget {
  @override
  _DumongnameState createState() => _DumongnameState();
}

class _DumongnameState extends State<Dumongname> {
  bool isButtonPressed = false; // 버튼 상태를 관리
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Provider 접근 (listen:false -> 버튼 클릭 시에만 setDumongName 호출)
    final mbtiProvider = Provider.of<MbtiProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상단 뒤로가기
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // 가운데 영역: 스크롤 가능하도록
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

                      // 이미지
                      Container(
                        width: 96,
                        height: 96,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/wavinghand.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // 텍스트 필드
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: '두몽이 이름',
                          hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFF5F5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFFFF5C35),
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
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            // 하단 버튼
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButtonPressed = true;
                  });

                  // Provider에 이름 저장
                  mbtiProvider.setDumongName(_controller.text);

                  // 다음 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EggPick()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonPressed ? const Color(0xFFFF5C35) : Colors.white,
                  side: BorderSide(
                    color: isButtonPressed
                        ? Colors.transparent
                        : const Color(0xFFB0B0B0),
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '두근두근 두몽이 탄생!',
                  style: TextStyle(
                    color: isButtonPressed
                        ? Colors.white
                        : const Color(0xFFB0B0B0),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
