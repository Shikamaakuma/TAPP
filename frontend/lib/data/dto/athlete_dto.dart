import 'package:frontend/data/dto/base_dto.dart';

class AthleteDto extends IdentifiedDTO {
  final String firstName;
  final String lastName;

  AthleteDto(super.id, this.firstName, this.lastName);

  factory AthleteDto.fromJson(dynamic json) {
    return AthleteDto(json['id'], json['firstName'], json['lastName']);
  }
}