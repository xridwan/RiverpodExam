import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          data: (character) => Text(character.name),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
