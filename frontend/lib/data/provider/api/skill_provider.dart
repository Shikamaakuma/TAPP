

import 'package:flutter/material.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get.dart';

class SkillApiProvider extends ProviderBase implements SkillProviderDef  {
  @override
  Future<List<SkillDto>> skills() async {
    Response response = await get('skills');
    return [
      for(dynamic json in response.body)
        SkillDto.fromJson(json)
    ];
  }

  @override
  Future<List<SkillDto>> tenantSkills(int tenantId) async {
    Response response = await get('$tenantId/skills');
    return [
      for(dynamic json in response.body)
        SkillDto.fromJson(json)
    ];
  }

  @override
  Future<void> addSkill(int tenantId, SkillDto skillDto) async {
    Response response = await post('$tenantId/add_skill', skillDto.toMap);
    debugPrint('Add Skill: ${response.statusCode}');
  }

  @override
  Future<void> deleteSkill(int tenantId, int skillId) async {
    Response response = await delete('$tenantId/skills/$skillId');
    debugPrint('Delete Skill: ${response.statusCode}');
  }
}