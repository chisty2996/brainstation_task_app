import 'package:brainstation_task_app/config/theme/theme.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_event.dart';
import 'package:brainstation_task_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(const GetItems()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task-23',
        theme: theme(),
        home: const HomeScreen(),
      ),
    );
  }
}

