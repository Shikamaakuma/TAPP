

import 'package:flutter/material.dart';
import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:get/get.dart';

import '../api_definitions.dart';

class AthleteApiProvider extends ProviderBase implements AthleteProviderDef {
  @override
  Future<List<AthleteDto>> tenantAthletes(int tenantId) async {
    Response response = await get('$tenantId/athletes');
    return [
      for(dynamic json in response.body)
        AthleteDto.fromJson(json)
    ];
  }

  @override
  Future<void> addAthlete(int tenantId, AthleteDto athleteDto) async {
    Response response = await post('$tenantId/add_athlete', athleteDto.toMap);
    debugPrint('Add Athlete: ${response.statusCode}');
  }
  
}