import 'package:flutter/material.dart';

class AnimalPickProvider extends ChangeNotifier {
  // 현재 선택된 동물의 인덱스
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  // 동물 목록
  final List<String> _animals = ['곰', '고양이', '강아지', '원숭이', '토끼'];
  final List<String> _images = [
    'assets/images/bear.png',
    'assets/images/cat.png',
    'assets/images/dog.png',
    'assets/images/monkey.png',
    'assets/images/rabbit.png',
  ];

  // Getter를 통해 외부에서 동물 목록과 이미지를 접근 가능하게 함
  List<String> get animals => _animals;
  List<String> get images => _images;

  // 동물 선택 메서드
  void selectAnimal(int index) {
    if (index < 0 || index >= _animals.length) return; // 범위 초과 방지

    _selectedIndex = index;
    notifyListeners(); // 상태 변경 알림
  }

  // 선택 초기화 메서드 (선택을 취소하거나 초기 상태로 되돌릴 때 사용)
  void clearSelection() {
    _selectedIndex = null;
    notifyListeners();
  }

  // 선택된 동물 이름 반환 (없을 경우 null 반환)
  String? get selectedAnimalName =>
      _selectedIndex != null ? _animals[_selectedIndex!] : null;

  // 선택된 동물 이미지 경로 반환 (없을 경우 null 반환)
  String? get selectedAnimalImage =>
      _selectedIndex != null ? _images[_selectedIndex!] : null;
}
