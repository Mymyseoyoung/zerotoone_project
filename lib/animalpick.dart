import 'package:flutter/material.dart';

class AnimalPick extends StatefulWidget {
  const AnimalPick({super.key});

  @override
  State<AnimalPick> createState() => _AnimalPickState();
}

class _AnimalPickState extends State<AnimalPick> {
  int? selectedAnimalIndex; // 선택된 동물 버튼의 인덱스
  final animals = ['곰', '고양이', '강아지', '원숭이', '토끼']; // 동물 이름 목록
  final images = [
    'assets/images/bear.png',
    'assets/images/cat.png',
    'assets/images/dog.png',
    'assets/images/monkey.png',
    'assets/images/rabbit.png',
  ]; // 동물 이미지 경로

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05), // 상단 여백
            Text(
              '두몽이 만들기',
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.055,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '함께 할 두몽이 종류를 골라볼까요?',
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.045,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: size.width * 0.04,
                  mainAxisSpacing: size.height * 0.03,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  if (index < animals.length) {
                    return AnimalCard(
                      name: animals[index],
                      imagePath: images[index],
                      size: size,
                      isSelected: selectedAnimalIndex == index,
                      onPressed: () {
                        setState(() {
                          selectedAnimalIndex = index; // 선택된 버튼 인덱스 저장
                        });
                      },
                    );
                  } else {
                    return EmptyAnimalCard(size: size);
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedAnimalIndex != null
                  ? () {
                      // 선택하기 버튼 클릭 시 동작
                      print("${animals[selectedAnimalIndex!]} 선택됨");
                    }
                  : null, // 선택이 없으면 비활성화
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAnimalIndex != null
                    ? const Color(0xFFFF5C35)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                  side: BorderSide(
                    color: selectedAnimalIndex != null
                        ? const Color(0xFFFF5C35)
                        : const Color(0xFFAEAEAE),
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              ),
              child: Center(
                child: Text(
                  selectedAnimalIndex != null
                      ? '${animals[selectedAnimalIndex!]} 선택하기'
                      : '선택하기',
                  style: TextStyle(
                    color: selectedAnimalIndex != null
                        ? Colors.white
                        : const Color(0xFF696969),
                    fontSize: size.width * 0.045,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: -0.56,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final Size size;
  final bool isSelected;
  final VoidCallback onPressed;

  const AnimalCard({
    required this.name,
    required this.imagePath,
    required this.size,
    required this.isSelected,
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
          border: Border.all(
            color: isSelected ? const Color(0xFFFF5C35) : Colors.transparent,
            width: 2,
          ),
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
