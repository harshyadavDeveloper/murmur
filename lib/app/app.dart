import 'package:flutter/material.dart';
import 'package:murmur/presentation/providers/journal_provider.dart';
import 'package:murmur/presentation/screens/home/home_screen.dart';
import 'package:murmur/repositories/journal_repository.dart';
import 'package:provider/provider.dart';

import 'package:murmur/core/di/injection.dart';

class MurmurApp extends StatelessWidget {
  const MurmurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              JournalProvider(getIt<JournalRepository>())..loadEntries(),
        ),
      ],
      child: MaterialApp(
        title: 'Murmur',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
