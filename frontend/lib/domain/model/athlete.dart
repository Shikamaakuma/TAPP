import 'package:frontend/data/dto/athlete_dto.dart';

import 'base.dart';

class AthleteModel extends IdentifiedModel{

  final String firstName;
  final String lastName;

  String get fullName => '$firstName $lastName';

  AthleteModel(super.id, this.firstName, this.lastName);

  factory AthleteModel.fromDto(AthleteDto dto) {
    return AthleteModel(dto.id, dto.firstName, dto.lastName);
  }
}