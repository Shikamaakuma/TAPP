import 'package:frontend/data/dto/user_dto.dart';
import 'package:frontend/data/provider/provider_base.dart';
import 'package:get/get.dart';

class UserProvider extends ProviderBase {

  Future<List<UserDto>> listUsers() async {
    Response response = await get('/athletes');

    if (response.isOk) {
      List<UserDto> user =[];
      for (var a in response.body){
        user.add(UserDto(a['firstname']));
      }
      return user;
    }
    else{
      throw Exception('error');
    }
}

}