import 'package:flutter/material.dart';
import 'package:gitmago/app.dart';
import 'package:gitmago/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),  // Provider 등록
      ],
      child: const GitmagoApp(),
    ),
  );
}
