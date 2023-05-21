import 'package:frontend/data/provider/api/progress_provider.dart';
import 'package:frontend/packages/gettools/getx_extension.dart';
import 'package:get/get.dart';

import 'api/athlete_provider.dart';
import 'api/auth_provider.dart';
import 'api/skill_provider.dart';
import 'api/tenant_provider.dart';
import 'api_definitions.dart';

class APIProvider {
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  AuthProviderDef get authProvider => Get.findOrPut(() => AuthApiProvider());
  TenantProviderDef get tenantProvider => Get.findOrPut(() => TenantApiProvider());
  SkillProviderDef get skillProvider => Get.findOrPut(() => SkillApiProvider());
  AthleteProviderDef get athleteProvider => Get.findOrPut(() => AthleteApiProvider());

  ProgressProviderDef get progressProvider => Get.findOrPut(() => ProgressApiProvider());


}
