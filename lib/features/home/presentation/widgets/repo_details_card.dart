import 'package:flutter/material.dart';

class RepoDetailsCard extends StatelessWidget {
  final String description;
  final String lastUpdated;
  final String visibility;
  final int starsCount;
  final String repoName;
  final int repoId;
  final int ownerId;

  const RepoDetailsCard({
    Key? key,
    required this.description,
    required this.lastUpdated,
    required this.visibility,
    required this.starsCount,
    required this.repoName,
    required this.repoId,
    required this.ownerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow(Icons.description, "Description", description),
            const SizedBox(height: 10.0),
            _buildRow(Icons.update, "Last Updated", lastUpdated),
            const SizedBox(height: 10.0),
            _buildRow(Icons.visibility, "Visibility", visibility),
            const SizedBox(height: 10.0),
            _buildRow(Icons.star, "Stars Count", starsCount.toString()),
            const SizedBox(height: 10.0),
            _buildRow(Icons.book, "Repo Name", repoName),
            const SizedBox(height: 10.0),
            _buildRow(Icons.numbers, "Repo ID", repoId.toString()),
            const SizedBox(height: 10.0),
            _buildRow(Icons.person, "Owner ID", ownerId.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
