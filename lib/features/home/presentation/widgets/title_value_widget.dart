import 'package:brainstation_task_app/features/home/domain/entities/home.dart';
import 'package:flutter/material.dart';

class TitleValueWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icons;

  const TitleValueWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                icons,
                color: Colors.white,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "$title:",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
