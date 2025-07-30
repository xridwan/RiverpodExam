import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_exam/core/error/failures.dart';
import 'package:riverpod_exam/core/network/dio_client.dart';
import 'package:riverpod_exam/domain/entity/character.dart';
import 'package:riverpod_exam/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final DioClient dioClient;

  CharacterRepositoryImpl(this.dioClient);

  @override
  Future<Either<Failures, List<Character>>> getCharacters() async {
    try {
      final response = await dioClient.get('character');
      final List<Character> characters = (response.data['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
      return Right(characters);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Character>> getCharacter(int id) async {
    try {
      final response = await dioClient.get('character/$id');
      final Character character = Character.fromJson(response.data);
      return Right(character);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
