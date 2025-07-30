import 'package:riverpod/riverpod.dart';
import 'package:riverpod_exam/core/di/injection_container.dart';
import 'package:riverpod_exam/domain/entity/character.dart';
import 'package:riverpod_exam/domain/usecase/get_character_usecase.dart';

final characterProvider = FutureProvider.autoDispose<List<Character>>((
  ref,
) async {
  final usecase = sl<GetCharacterUsecase>();
  final result = await usecase();
  return result.fold((failure) => Future.error(failure), (data) => data);
});

final characterDetailProvider = FutureProvider.family
    .autoDispose<Character, int>((ref, id) async {
      final usecase = sl<GetCharacterDetailUsecase>();
      final result = await usecase(id);
      return result.fold((failure) => Future.error(failure), (data) => data);
    });
