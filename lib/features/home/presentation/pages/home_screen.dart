import 'package:brainstation_task_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-23"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
         if(state is HomeStateLoading){
           return const Center(child: CupertinoActivityIndicator());
         }
         if(state is HomeStateFetched){
           if(state.homeItems!=null){
             return ListView.builder(
               itemBuilder: (context, index) {
                 return Text(index.toString());
               },
               itemCount: state.homeItems?.length,
             );
           }

         }
         return const SizedBox();
        },
      ),
    );
  }
}
