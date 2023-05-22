import 'package:frontend/ui/view/start/start_screen.dart';
import 'package:go_router/go_router.dart';

import '../view/tenant_list/tenant_list_view.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/start', builder: (context, state) => StartScreen(),),
    GoRoute(path: '/tenants', builder: (context, state) => TenantListScreen(),
    )
  ]
);