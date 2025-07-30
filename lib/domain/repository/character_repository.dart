import 'package:dartz/dartz.dart';
import 'package:riverpod_exam/core/error/failures.dart';
import 'package:riverpod_exam/domain/entity/character.dart';

abstract class CharacterRepository {
  Future<Either<Failures, List<Character>>> getCharacters();
  Future<Either<Failures, Character>> getCharacter(int id);
}
