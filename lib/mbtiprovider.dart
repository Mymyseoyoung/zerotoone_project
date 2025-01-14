import 'package:collection/collection.dart'; // ListEquality 사용
import 'package:flutter/material.dart';

class MbtiProvider with ChangeNotifier {
  String answer1 = '';
  String answer2 = '';
  String answer3 = '';
  String answer4 = '';
  String mbtiResult = '';
  String eggType = '';
  String eggImage = '';

  String dumongName = '';
  void setAnswer(int questionNumber, String answer) {
    if (questionNumber == 1) answer1 = answer;
    if (questionNumber == 2) answer2 = answer;
    if (questionNumber == 3) answer3 = answer;
    if (questionNumber == 4) answer4 = answer;
    notifyListeners();
  }

  void calculateMbti() {
    final answers = [answer1, answer2, answer3, answer4];
    mbtiResult = _determineMbti(answers);
    _assignEggTypeAndImage();
    notifyListeners();
  }

  // 두몽이 이름 설정 메서드 추가
  void setDumongName(String name) {
    dumongName = name;
    notifyListeners();
  }

  String _determineMbti(List<String> answers) {
    final eq = ListEquality().equals; // ListEquality 객체 생성

    if (eq(answers, ['b', 'b', 'a', 'b'])) return 'ENFP';
    if (eq(answers, ['b', 'b', 'a', 'a'])) return 'ENFJ';
    if (eq(answers, ['b', 'a', 'a', 'b'])) return 'ENTP';
    if (eq(answers, ['b', 'a', 'a', 'a'])) return 'ENTJ';

    if (eq(answers, ['b', 'b', 'b', 'b'])) return 'ESFP';
    if (eq(answers, ['b', 'a', 'b', 'b'])) return 'ESTP';
    if (eq(answers, ['b', 'a', 'b', 'a'])) return 'ESTJ';
    if (eq(answers, ['b', 'b', 'b', 'a'])) return 'ESFJ';

    if (eq(answers, ['a', 'b', 'a', 'b'])) return 'INFP'; // abab
    if (eq(answers, ['a', 'b', 'a', 'a'])) return 'INFJ';
    if (eq(answers, ['a', 'a', 'a', 'b'])) return 'INTP';
    if (eq(answers, ['a', 'a', 'a', 'a'])) return 'INTJ';

    if (eq(answers, ['a', 'b', 'b', 'b'])) return 'ISFP';
    if (eq(answers, ['a', 'a', 'b', 'b'])) return 'ISTP';
    if (eq(answers, ['a', 'b', 'b', 'a'])) return 'ISFJ';
    if (eq(answers, ['a', 'a', 'b', 'a'])) return 'ISTJ';

    return '';
  }

  void _assignEggTypeAndImage() {
    switch (mbtiResult) {
      case 'ENFP':
        eggType = '열정넘치는 인싸';
        eggImage = 'assets/images/yellowegg.png';
        break;
      case 'ENFJ':
        eggType = '지혜로운 협동가';
        eggImage = 'assets/images/yellowegg.png';
        break;
      case 'ENTP':
        eggType = '창의력 폭발 도전가';
        eggImage = 'assets/images/blueegg.png';
        break;
      case 'ENTJ':
        eggType = '자신감 뿜뿜 리더';
        eggImage = 'assets/images/blueegg.png';
        break;
      case 'ESTP':
        eggType = '마이웨이 행동력';
        eggImage = 'assets/images/greenegg.png';
        break;
      case 'ESFP':
        eggType = '재밌는 분위기메이커';
        eggImage = 'assets/images/greenegg.png';
        break;
      case 'ESTJ':
        eggType = '현실적인 비즈니스맨';
        eggImage = 'assets/images/pinkegg.png';
        break;
      case 'ESFJ':
        eggType = '친절한 인맥부자';
        eggImage = 'assets/images/pinkegg.png';
        break;
      case 'INFP':
        eggType = '따뜻한 감성쟁이';
        eggImage = 'assets/images/bluepinkegg.png';
        break;
      case 'INTP':
        eggType = '독창적인 전략가';
        eggImage = 'assets/images/bluepinkegg.png';
        break;
      case 'INFJ':
        eggType = '성실한 알잘딱깔센';
        eggImage = 'assets/images/yellowegg.png';
        break;
      case 'INTJ':
        eggType = '호기심 많은 똑똑이';
        eggImage = 'assets/images/blueegg.png';
        break;
      case 'ISFP':
        eggType = '겸손한 순둥이';
        eggImage = 'assets/images/greenegg.png';
        break;
      case 'ISTP':
        eggType = '논리왕 백과사전';
        eggImage = 'assets/images/pinkegg.png';
        break;
      case 'ISFJ':
        eggType = '꼼꼼한 모범생';
        eggImage = 'assets/images/bluepinkegg.png';
        break;
      case 'ISTJ':
        eggType = '책임감있는 선비';
        eggImage = 'assets/images/yellowegg.png';
        break;
      default:
        eggType = '';
        eggImage = '';
    }
  }
}
