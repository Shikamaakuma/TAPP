import 'package:frontend/ui/navigation/bindings.dart';
import 'package:frontend/ui/view/athlete/user_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> get pages => [
      GetPage(name: '/user', page: () => UserView(), binding: UserBindings()),
    ];
