import 'package:dartz/dartz.dart';
import 'package:riverpod_exam/core/error/exception.dart';
import 'package:riverpod_exam/core/error/failure.dart';
import 'package:riverpod_exam/core/network/dio_client.dart';
import 'package:riverpod_exam/domain/entity/character.dart';
import 'package:riverpod_exam/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final DioClient dioClient;

  CharacterRepositoryImpl(this.dioClient);

  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    try {
      final response = await dioClient.get('character');
      final List<Character> characters = (response.data['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
      return Right(characters);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Character>> getCharacter(int id) async {
    try {
      final response = await dioClient.get('character/$id');
      final Character character = Character.fromJson(response.data);
      return Right(character);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'Server error'));
    }
  }
}
