import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mbtiprovider.dart'; // MbtiProvider import
import 'welcomepage.dart'; // 첫 화면 Welcomepage import
import 'animalpickprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MbtiProvider()), // MBTI 상태 관리 객체
        ChangeNotifierProvider(
            create: (_) => AnimalPickProvider()), // AnimalPick 상태 관리 객체
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Welcomepage(), // 앱의 첫 화면
    );
  }
}
