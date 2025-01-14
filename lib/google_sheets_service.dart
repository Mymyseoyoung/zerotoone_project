import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, String>> fetchUsersFromGoogleSheets() async {
  const url = '1xJ3WmvZPBUEeMq1eQ0Z9a0eKBFfkcXbGVgwF9WeZ6N4';
  const apiKey = '1f1c93d6fe38eb7fee4193ac9bf52d7f0db28a0e';
  const range = 'H10:I16';
  const sheetNum = '1';

  final response = await http.get(Uri.parse(
      'https://sheets.googleapis.com/v4/spreadsheets/$url/values/Sheet$sheetNum!$range?key=$apiKey'));

  if (response.statusCode == 200) {
    // 응답 상태 코드가 200이면 성공적으로 데이터를 받았다는 뜻
    Map<String, dynamic> data =
        json.decode(response.body); // JSON 응답 본문을 디코딩하여 Map으로 변환
    List rows = data['values']; // 'values' 필드에서 행 데이터를 가져옴

    Map<String, String> users = {}; // 사용자 정보를 저장할 Map 생성
    for (var row in rows) {
      // 각 행(row)을 반복하면서
      if (row.length >= 2) {
        // 각 행에 최소 2개의 값(ID, 비밀번호)이 있을 때만 처리
        users[row[0]] = row[1]; // row[0] -> ID, row[1] -> 비밀번호
      }
    }
    return users; // 사용자 정보를 담고 있는 Map을 반환
  } else {
    // 응답 상태 코드가 200이 아니면 예외를 던짐
    throw Exception('Failed to load data from Google Sheets');
  }
}
