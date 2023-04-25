import 'package:frontend/data/provider/api_definitions.dart';
import 'package:frontend/data/provider/api_moked/auth_provider.dart';
import 'package:frontend/data/provider/api_moked/user_provider.dart';

class APIProvider {
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  AuthProviderDef get authProvider => AuthProvider();
  UserProviderDef get userProvider => UserProvider();


}