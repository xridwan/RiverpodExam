import 'package:dartz/dartz.dart';
import 'package:riverpod_exam/core/error/failure.dart';
import 'package:riverpod_exam/domain/entity/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
  Future<Either<Failure, Character>> getCharacter(int id);
}
