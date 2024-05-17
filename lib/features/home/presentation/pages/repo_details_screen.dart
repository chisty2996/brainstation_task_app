import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:brainstation_task_app/features/home/presentation/widgets/owner_card.dart';
import 'package:brainstation_task_app/features/home/presentation/widgets/repo_details_card.dart';
import 'package:flutter/material.dart';

class RepoDetailsPage extends StatelessWidget {
  static const routeName = "repo_details_page";
  final HomeEntity? repoModel;

  const RepoDetailsPage({super.key, required this.repoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: UserProfileCard(
                  imageUrl: repoModel?.ownerEntity?.avatarUrl ?? '',
                  userName: repoModel?.ownerEntity?.ownerName ?? '',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: RepoDetailsCard(
                  description: repoModel?.description ?? "",
                  lastUpdated: repoModel?.lastUpdate ?? "",
                  visibility: repoModel?.visibility ?? "",
                  starsCount: repoModel?.starCount ?? 0,
                  repoName: repoModel?.name ?? "",
                  repoId: repoModel?.id ?? 0,
                  ownerId: repoModel?.ownerEntity?.ownerId ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
