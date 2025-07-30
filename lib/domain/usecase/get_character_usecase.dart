import 'package:dartz/dartz.dart';
import 'package:riverpod_exam/core/error/failures.dart';
import 'package:riverpod_exam/domain/entity/character.dart';
import 'package:riverpod_exam/domain/repository/character_repository.dart';

class GetCharacterUsecase {
  final CharacterRepository characterRepository;

  GetCharacterUsecase(this.characterRepository);

  Future<Either<Failures, List<Character>>> call() async {
    return await characterRepository.getCharacters();
  }
}

class GetCharacterDetailUsecase {
  final CharacterRepository characterRepository;

  GetCharacterDetailUsecase(this.characterRepository);

  Future<Either<Failures, Character>> call(int id) async {
    return await characterRepository.getCharacter(id);
  }
}
