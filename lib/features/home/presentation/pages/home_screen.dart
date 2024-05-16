import 'dart:developer';

import 'package:brainstation_task_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home.dart';
import '../bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-23"),
      ),
      body: Column(
        children: [
          // BlocBuilder<HomeBloc, HomeState>(
          //   builder: (BuildContext context, state) {
          //     return TextField(
          //       controller: _searchController,
          //       decoration: const InputDecoration(
          //         labelText: 'Search',
          //         hintText: 'Enter keyword to filter',
          //         prefixIcon: Icon(Icons.search),
          //       ),
          //       onChanged: (value) {
          //         if(value.isEmpty){
          //           context.read<HomeBloc>().add(const GetItems());
          //         }
          //         else{
          //           context.read<HomeBloc>().add(FilterItems(value));
          //         }
          //       },
          //     );
          //   },
          // ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, state) {
             if(state is HomeStateLoading){
               return const Center(child: CupertinoActivityIndicator());
             }
             if(state is HomeStateFetched || state is HomeStateFiltered){
               List<HomeEntity>? items;
               if (state is HomeStateFetched) {
                 items = state.homeItems;
               } else if (state is HomeStateFiltered) {

                 items = state.filteredItems;

               }
               log("items length: ${items?.length}");
               if(items!=null && items.isNotEmpty){
                 return Expanded(
                   child: ListView.builder(
                     itemBuilder: (context, index) {
                       return Text(items?[index].title??"");
                     },
                     itemCount: items.length,
                   ),
                 );
               }
               else{
                 return const Center(child: Text("No items found"));
               }

             }
             return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
