import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gsheet_service.dart';
import 'animalpickprovider.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  List<Map<String, dynamic>> rankers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await GSheetService.fetchRankers();
      setState(() {
        rankers = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animalPickProvider = Provider.of<AnimalPickProvider>(context);

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(2),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                        // 동물 이미지 설정
                        final image = ranker['rank'] == 1
                            ? (animalPickProvider.selectedAnimalImage ??
                                'assets/images/default.png')
                            : 'assets/images/default.png';

                        return _buildRankerItem(
                          {
                            ...ranker,
                            'image': image,
                          },
                          size,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildRankerItem(Map<String, dynamic> ranker, Size size) {
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
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(ranker['image']),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFFFF5C35),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        // TODO: 화면 이동 구현
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.leaderboard),
          label: '랭킹',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          label: '알림',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: '내 정보',
        ),
      ],
    );
  }
}
