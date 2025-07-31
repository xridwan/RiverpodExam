import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_exam/presentation/widgets/character_item_widget.dart';

import '../../core/error/failure.dart';
import '../../core/router/navigation_route.dart';
import '../provider/app_provider.dart';

class CharacterPage extends ConsumerWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsyncValue = ref.watch(characterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: characterAsyncValue.when(
        data: (characters) {
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return CharacterItemWidget(
                name: character.name,
                status: character.status,
                image: character.image,
                onTap: () {
                  context.push(
                    NavigationRoute.characterDetailPage,
                    extra: character.id,
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Text(err is Failure ? err.errorMessage : "Unknown error"),
        ),
      ),
    );
  }
}
