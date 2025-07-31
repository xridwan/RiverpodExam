import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/character.dart';
import '../provider/app_provider.dart';

class CharacterDetailPage extends ConsumerWidget {
  final int id;

  const CharacterDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsyncValue = ref.watch(characterDetailProvider(id));

    return Scaffold(
      appBar: AppBar(title: const Text('Character Detail')),
      body: Center(
        child: characterAsyncValue.when(
          data: (character) => _buildCharacterDetail(character),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildCharacterDetail(Character character) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(character.image),
        ),
        SizedBox.square(dimension: 16),
        Text(character.name),
        SizedBox.square(dimension: 16),
        Text(character.status),
      ],
    );
  }
}
