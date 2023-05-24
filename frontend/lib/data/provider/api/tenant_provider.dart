
import 'package:flutter/material.dart';
import 'package:frontend/data/dto/skill_dto.dart';
import 'package:frontend/data/dto/tenant_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get.dart';

import '../../dto/athlete_dto.dart';

class TenantApiProvider extends ProviderBase implements TenantProviderDef {
  @override
  Future<TenantDetailDto> tenantDetails(int tenantId) async {
    await Future.delayed(Duration(seconds: 3));
    return TenantDetailDto(
        tenantId,
        'Dies ist ein Kletterverein',
        'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
      [
        AthleteDto(1, 'Dominik', 'Villiger')
      ],
      [
        SkillDto(1, 'Klettern', 'draussen', 6)
      ]
    );
  }

  @override
  Future<void> updateTenant(TenantDto tenantDto) async {
    Response response = await post('add_tenant', tenantDto.toMap);
    debugPrint('Add Athlete: ${response.statusCode}');
  }

  @override
  Future<List<TenantDto>> getTenants() async {
    Response response = await get('tenants',);

    return [
      for (dynamic json in response.body)
        TenantDto.fromJson(json)
    ];
  }


}