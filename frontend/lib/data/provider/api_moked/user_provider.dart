import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/api/provider_base.dart';
import 'package:frontend/data/provider/api_definitions.dart';
import 'package:get/get.dart';

class UserProvider extends ProviderBase implements UserProviderDef {

  @override
  Future<List<UserDto>> listUsers() async {
    Response response = await get('/athletes');

    // TODO: remove await
    await Future.delayed(const Duration(seconds: 3));

    if (response.isOk) {
      List<UserDto> user =[];
      for (var a in response.body){
        user.add(UserDto(1, 'domi', 'domi@mail.ch'));
      }
      return user;
    }
    else {
      throw Exception('error');
    }
}
}