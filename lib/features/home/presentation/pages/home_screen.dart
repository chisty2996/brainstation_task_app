import 'dart:developer';

import 'package:brainstation_task_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:brainstation_task_app/features/home/presentation/bloc/home_state.dart';
import 'package:brainstation_task_app/features/home/presentation/widgets/repository_card_tile.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Trigger initial load
    context.read<HomeBloc>().add(const GetItems());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<HomeBloc>().add(const LoadMoreItems());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task-23"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
          log("state: $state");
          if (state is HomeStateLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is HomeStateFetched ||
              state is HomeStateFiltered ||
              state is HomeStateLoadingMore) {
            List<HomeEntity>? items;
            bool isLoadingMore = false;

            if (state is HomeStateFetched) {
              items = state.homeItems;
            } else if (state is HomeStateFiltered) {
              items = state.filteredItems;
            } else if (state is HomeStateLoadingMore) {
              items = state.homeItems;
              isLoadingMore = true;
            }

            if (items != null && items.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: items.length + (isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= items!.length) {
                          return const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: CupertinoActivityIndicator(),
                          ));
                        }
                        return RepositoryCardTile(repoModel: items[index]);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("No items found"));
            }
          } else if (state is HomeStateError) {
            return Center(child: Column(
              children: [
                Text("Error: ${state.dioException?.message ?? 'Unknown error'}"),
                SizedBox(height: 2,),
                ElevatedButton(onPressed: (){

                  context.read<HomeBloc>().add(const GetItems());
                }, child: Text("Retry")),
              ],
            ));
          } else {
            return const Center(child: Text("No items found"));
          }
        },
      ),
    );
  }
}
