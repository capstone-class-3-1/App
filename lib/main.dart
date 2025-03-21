import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gitmago/app.dart';
import 'package:gitmago/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

/* issue test */

Future<void> main() async {
  // .env 파일 로드
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ), // Provider 등록
      ],
      child: const GitmagoApp(),
    ),
  );
}
