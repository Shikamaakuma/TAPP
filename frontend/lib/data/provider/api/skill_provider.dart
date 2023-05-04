

import 'package:flutter/material.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get.dart';

class SkillApiProvider extends ProviderBase implements SkillProviderDef  {
  @override
  Future<List<SkillDto>> skills() async {
    Response response = await get('https://160.85.252.235:8080/api/v1/skills');
    return [
      for(dynamic json in response.body)
        SkillDto.fromJson(json)
    ];
  }

  @override
  Future<List<TenantSkillsDto>> tenantSkills(int tenantId) async {
    Response response = await get('https://160.85.252.235:8080/api/v1/$tenantId/tenantskills');
    return [
      for(dynamic json in response.body)
        TenantSkillsDto.fromJson(json)
    ];
  }

  @override
  Future<void> addSkill(int tenantId, SkillDto skillDto) async {
    Response response = await post('https://localhost:8081/api/v1/add_skill', skillDto.toMap);
    debugPrint('Add Skill: ${response.statusCode}');
  }
}