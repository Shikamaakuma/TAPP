

import 'package:frontend/data/dto/athlete_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:get/get.dart';

import '../api_definitions.dart';

class AthleteApiProvider extends ProviderBase implements AthleteProviderDef {
  @override
  Future<List<AthleteDto>> tenantAthletes(int tenantId) async {
    Response response = await get('https://localhost:8081/api/v1/skills');
    return [
      for(dynamic json in response.body)
        AthleteDto.fromJson(json)
    ];
  }
  
}