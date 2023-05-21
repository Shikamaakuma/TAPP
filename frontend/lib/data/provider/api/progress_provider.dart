import 'package:flutter/material.dart';
import 'package:frontend/data/dto/progress_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ProgressApiProvider extends ProviderBase implements ProgressProviderDef {
  @override
  Future<void> addProgress(int tenantId, ProgressDto progressDto) async {
    Response response = await post('$tenantId/athletes/${progressDto.athleteId}',
        progressDto.toMap);
    debugPrint('Add progress: ${response.statusCode}');
  }

  @override
  Future<List<ProgressDto>> athleteProgress(int tenantId, int athleteId) async {
    Response response = await get('$tenantId/progress/$athleteId');
    return [
      for(dynamic json in response.body)
        ProgressDto.fromJson(json)
    ];
  }

}