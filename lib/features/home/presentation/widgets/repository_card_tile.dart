import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:brainstation_task_app/features/home/presentation/pages/repo_details_screen.dart';
import 'package:brainstation_task_app/features/home/presentation/widgets/title_value_widget.dart';
import 'package:flutter/material.dart';

class RepositoryCardTile extends StatelessWidget {
  final HomeEntity? repoModel;

  const RepositoryCardTile({super.key, required this.repoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RepoDetailsPage(repoModel: repoModel)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleValueWidget(
                    title: "Name", value: repoModel?.name ?? '', icons: Icons.file_copy_outlined),
                const SizedBox(
                  height: 8,
                ),
                TitleValueWidget(
                    title: "Stars", value: repoModel?.starCount.toString() ?? '', icons: Icons.star),
                const SizedBox(
                  height: 8,
                ),
                TitleValueWidget(
                    title: "Owner",
                    value: repoModel?.ownerEntity?.ownerName ?? '',
                    icons: Icons.person),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RepoDetailsPage(repoModel: repoModel)));
                  },
                  child: const Text(
                    "See Details",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
