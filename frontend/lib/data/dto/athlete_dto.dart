import 'package:frontend/data/dto/base_dto.dart';

import 'image_dto.dart';

/// Represents the api data of an athlete
class AthleteDto extends IdentifiedDTO {
  final String firstName;
  final String lastName;
  final ImageDto? image;

  AthleteDto(super.id, this.firstName, this.lastName, [this.image = null]);

  factory AthleteDto.fromJson(dynamic json) {
    return AthleteDto(json['id'], json['firstName'], json['lastName'],
        json['picture'] != null ? ImageDto.fromJson(json) : null);
  }

  Map<String, dynamic> get toMap => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'picture': image?.bytes,
    'imageType': image?.mimetype,
  };
}