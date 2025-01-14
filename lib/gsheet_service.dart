import 'dart:convert';
import 'package:http/http.dart' as http;

class GSheetService {
  static const String _spreadsheetId =
      '1xJ3WmvZPBUEeMq1eQ0Z9a0eKBFfkcXbGVgwF9WeZ6N4'; // 스프레드시트 ID
  static const String _apiKey =
      'AIzaSyAVDSUqxQMi4vY-RCZfX5Z7dZ4kfhDJb_w'; // Google API 키

  /// 사용자 정보(ID, 비밀번호) 가져오기 (Sheet3의 H10:I16)
  static Future<Map<String, String>> fetchUsers() async {
    const range = "'참고. 구성원 정보'!H10:I16"; // ID와 비밀번호 범위
    final url =
        'https://sheets.googleapis.com/v4/spreadsheets/$_spreadsheetId/values/$range?key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List rows = data['values'];

      Map<String, String> users = {};
      for (var row in rows) {
        if (row.length >= 2) {
          users[row[0]] = row[1]; // ID를 키, 비밀번호를 값으로 저장
        }
      }
      return users;
    } else {
      throw Exception(
          'Failed to load user data from Google Sheets. Status: ${response.statusCode}');
    }
  }

  /// 랭킹 데이터(이름, 레벨, 경험치) 가져오기 ('참고. 올해 경험치'의 C26:G32)
  static Future<List<Map<String, dynamic>>> fetchRankers() async {
    const range = "'참고. 올해 경험치'!C26:G32"; // 이름, 레벨, 경험치 범위
    final url =
        'https://sheets.googleapis.com/v4/spreadsheets/$_spreadsheetId/values/$range?key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<List<dynamic>> rows = data['values'];

      // 데이터 파싱
      List<Map<String, dynamic>> rankers = [];
      for (var i = 0; i < rows.length; i++) {
        final row = rows[i];
        rankers.add({
          'name': row[0], // C열: 이름
          'level': row[3], // F열: 레벨
          'exp': int.parse(row[4]), // G열: 경험치
        });
      }

      // 경험치 기준으로 내림차순 정렬
      rankers.sort((a, b) => b['exp'].compareTo(a['exp']));

      // 순위 추가
      for (var i = 0; i < rankers.length; i++) {
        rankers[i]['rank'] = i + 1;
      }

      return rankers;
    } else {
      throw Exception(
          'Failed to load ranking data from Google Sheets. Status: ${response.statusCode}');
    }
  }
}
