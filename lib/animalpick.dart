import 'package:flutter/material.dart';

class AnimalPick extends StatelessWidget {
  const AnimalPick({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft, // 제목을 왼쪽 정렬
          child: Text(
            '두몽이 만들기',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  '함께 할 두몽이 종류를 골라볼까요?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: GridView.builder(
                itemCount: 6, // 6개의 버튼
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 한 줄에 2개의 버튼
                  crossAxisSpacing: size.width * 0.05,
                  mainAxisSpacing: size.height * 0.03,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  if (index < 5) {
                    // 동물 버튼
                    final animals = ['곰', '고양이', '강아지', '원숭이', '토끼'];
                    final images = [
                      'assets/images/bear.png',
                      'assets/images/cat.png',
                      'assets/images/dog.png',
                      'assets/images/monkey.png',
                      'assets/images/rabbit.png'
                    ];

                    return AnimalCard(
                      name: animals[index],
                      imagePath: images[index],
                      size: size,
                      onPressed: () {
                        // 동물 버튼 클릭 시 동작
                      },
                    );
                  } else {
                    // 마지막 빈 버튼
                    return EmptyAnimalCard(size: size);
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
            child: ElevatedButton(
              onPressed: () {
                // "선택하기" 버튼 클릭 시 동작 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                  side: BorderSide(
                    width: 2,
                    color: const Color(0xFFAEAEAE),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              ),
              child: Text(
                '선택하기',
                style: TextStyle(
                  color: const Color(0xFF696969),
                  fontSize: size.width * 0.045,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  letterSpacing: -0.56,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final Size size;
  final VoidCallback onPressed;

  const AnimalCard({
    required this.name,
    required this.imagePath,
    required this.size,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: size.width * 0.3,
                height: size.width * 0.3,
                fit: BoxFit.cover,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyAnimalCard extends StatelessWidget {
  final Size size;

  const EmptyAnimalCard({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
