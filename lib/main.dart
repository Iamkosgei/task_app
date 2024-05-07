import 'package:flutter/material.dart';
import 'package:taks_app/core/di/injection.dart';
import 'package:taks_app/core/ui/app_colors.dart';
import 'package:taks_app/core/ui/theme.dart';
import 'package:taks_app/features/tasks/presentation/tasks_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        theme: buildTheme(Brightness.light),
        home: const TasksPage());
  }
}
