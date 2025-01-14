import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbti1.dart';
import 'animalpickprovider.dart'; // 방금 만든 provider

class AnimalPick extends StatelessWidget {
  const AnimalPick({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AnimalPickProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
              // provider의 animals.length만큼 그리드
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: size.width * 0.04,
                  mainAxisSpacing: size.height * 0.03,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  if (index < provider.animals.length) {
                    return AnimalCard(
                      name: provider.animals[index],
                      imagePath: provider.images[index],
                      size: size,
                      isSelected: provider.selectedIndex == index,
                      onPressed: () {
                        // Provider로 상태 저장
                        provider.selectAnimal(index);
                      },
                    );
                  } else {
                    return EmptyAnimalCard(size: size);
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              ElevatedButton(
                onPressed: provider.selectedIndex != null
                    ? () {
                        // 선택하기 버튼 클릭 시 동작
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mbti1()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: provider.selectedIndex != null
                      ? const Color(0xFFFF5C35)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                    side: BorderSide(
                      color: provider.selectedIndex != null
                          ? const Color(0xFFFF5C35)
                          : const Color(0xFFAEAEAE),
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                ),
                child: Center(
                  child: Text(
                    provider.selectedIndex != null
                        ? '${provider.animals[provider.selectedIndex!]} 선택하기'
                        : '선택하기',
                    style: TextStyle(
                      color: provider.selectedIndex != null
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
      ),
    );
  }
}

// AnimalCard, EmptyAnimalCard는 기존과 동일
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isSelected) // 선택된 경우에만 체크 아이콘 표시
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Icon(
                        Icons.check_box,
                        color: const Color(0xFFFF5C35),
                        size: size.width * 0.05,
                      ),
                    ),
                ],
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
