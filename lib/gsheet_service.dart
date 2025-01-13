import 'dart:convert';
import 'package:http/http.dart' as http;

class GSheetService {
  static const String _spreadsheetId =
      '1xJ3WmvZPBUEeMq1eQ0Z9a0eKBFfkcXbGVgwF9WeZ6N4'; // 스프레드시트 ID
  static const String _apiKey =
      'AIzaSyAVDSUqxQMi4vY-RCZfX5Z7dZ4kfhDJb_w'; // Google API 키
  static const String _range = "'참고. 구성원 정보'!H10:I16"; // 시트3의 H10:I16 범위

  /// Google Sheets에서 사용자 정보(ID, 비밀번호) 가져오기
  static Future<Map<String, String>> fetchUsers() async {
    final url =
        'https://sheets.googleapis.com/v4/spreadsheets/$_spreadsheetId/values/$_range?key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List rows = data['values'];

      Map<String, String> users = {};
      for (var row in rows) {
        if (row.length >= 2) {
          users[row[0]] = row[1]; // ID와 비밀번호를 매핑
        }
      }
      return users;
    } else {
      throw Exception(
          'Failed to load data from Google Sheets. Status code: ${response.statusCode}');
    }
  }
}
