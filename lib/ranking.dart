import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'animalpickprovider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animalPickProvider = Provider.of<AnimalPickProvider>(context);

    final List<Map<String, dynamic>> rankers = [
      {
        'rank': 1,
        'name': '김지수',
        'exp': 44500,
        'level': 'Lv. F2-Ⅱ',
        'image': animalPickProvider.selectedAnimalImage ??
            'assets/images/default.png',
      },
      {
        'rank': 2,
        'name': '허재민',
        'exp': 43000,
        'level': 'Lv. F2-Ⅰ',
        'image': animalPickProvider.animals.length > 1
            ? animalPickProvider.images[1]
            : 'assets/images/default.png',
      },
      {
        'rank': 3,
        'name': '조선우',
        'exp': 27690,
        'level': 'Lv. F2-Ⅱ',
        'image': animalPickProvider.animals.length > 2
            ? animalPickProvider.images[2]
            : 'assets/images/default.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Ranking',
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF5C35),
                  ),
                ),
              ),
              Column(
                children: rankers.map((ranker) {
                  return _buildRankerItem(context, ranker, size);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRankerItem(
      BuildContext context, Map<String, dynamic> ranker, Size size) {
    bool isTop3 = ranker['rank'] <= 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isTop3 ? const Color(0xFFFFCCC0) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFF5C35), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ranker['image']),
                  ),
                  if (ranker['rank'] == 1)
                    Positioned(
                      top: -8,
                      right: -8,
                      child: Image.asset(
                        'assets/images/crown.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ranker['rank']}위 - ${ranker['name']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isTop3 ? const Color(0xFFFF5C35) : Colors.black,
                      ),
                    ),
                    Text('${ranker['exp']} EXP',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        )),
                    Text(ranker['level'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isTop3
                              ? const Color(0xFFFF5C35)
                              : Colors.grey[700],
                        )),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: 3, // Ranking 화면이 선택된 상태
      selectedItemColor: const Color(0xFFFF5C35),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 3) {
          // 이미 Ranking 페이지이므로 아무 작업도 하지 않음
          return;
        }
        // 다른 페이지로 이동해야 하는 경우
        switch (index) {
          case 0:
            print("Exp 페이지로 이동");
            break;
          case 1:
            print("Calendar 페이지로 이동");
            break;
          case 2:
            print("Home 페이지로 이동");
            break;
          case 4:
            print("Settings 페이지로 이동");
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/exp.svg', width: 24, height: 24),
          label: 'exp',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/calendar.svg',
              width: 24, height: 24),
          label: 'calendar',
        ),
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset('assets/icons/home.svg', width: 24, height: 24),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/ranking.svg',
              width: 24, height: 24),
          label: 'ranking',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/categories.svg',
              width: 24, height: 24),
          label: 'settings',
        ),
      ],
    );
  }
}
