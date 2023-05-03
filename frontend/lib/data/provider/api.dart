import 'api/athlete_provider.dart';
import 'api/auth_provider.dart';
import 'api/skill_provider.dart';
import 'api/tenant_provider.dart';
import 'api_definitions.dart';

class APIProvider {
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  AuthProviderDef get authProvider => AuthApiProvider();
  TenantProviderDef get tenantProvider => TenantApiProvider();
  SkillProviderDef get skillProvider => SkillApiProvider();
  AthleteProviderDef get athleteProvider => AthleteApiProvider();


}
