import 'package:flutter/material.dart';
import 'package:murmur/app/app.dart';
import 'package:murmur/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const MurmurApp());
}
