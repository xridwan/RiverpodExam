import 'package:flutter/material.dart';

class CharacterItemWidget extends StatelessWidget {
  final String name;
  final String status;
  final String image;
  final VoidCallback onTap;

  const CharacterItemWidget({
    super.key,
    required this.name,
    required this.status,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(radius: 32, backgroundImage: NetworkImage(image)),
            SizedBox.square(dimension: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox.square(dimension: 8),
                  Text(status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
