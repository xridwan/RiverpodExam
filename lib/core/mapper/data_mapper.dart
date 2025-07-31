import 'package:riverpod_exam/data/model/character_model.dart';

import '../../domain/entity/character.dart';

extension CharacterExtension on CharacterModel {
  Character toDomain() {
    return Character(id: id, name: name, status: status, image: image);
  }
}
