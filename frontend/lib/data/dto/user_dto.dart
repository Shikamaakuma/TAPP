import 'package:frontend/data/dto/base_dto.dart';

class UserDto extends IdentifiedDTO{
  final String username;
  final String email;


  UserDto(super.id, this.username, this.email);
}

class AthleteDto extends IdentifiedDTO {
  final String firstName;
  final String lastName;

  AthleteDto(super.id, this.firstName, this.lastName);
}