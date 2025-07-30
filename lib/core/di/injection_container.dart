import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_exam/core/network/dio_client.dart';
import 'package:riverpod_exam/data/character_repository_impl.dart';
import 'package:riverpod_exam/domain/repository/character_repository.dart';
import 'package:riverpod_exam/domain/usecase/get_character_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<GetCharacterUsecase>(
    () => GetCharacterUsecase(sl<CharacterRepository>()),
  );
  sl.registerLazySingleton<GetCharacterDetailUsecase>(
    () => GetCharacterDetailUsecase(sl<CharacterRepository>()),
  );
}
