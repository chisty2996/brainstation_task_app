import 'package:brainstation_task_app/features/home/presentation/pages/home_screen.dart';
import 'package:brainstation_task_app/features/home/presentation/pages/repo_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeScreen());
      default:
        return _materialRoute(const HomeScreen());
    }
  }


  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}