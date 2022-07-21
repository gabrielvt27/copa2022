import 'package:copa2022/app/core/constants.dart';
import 'package:copa2022/app/countries/country_page.dart';
import 'package:copa2022/app/countries/country_repository_imp.dart';
import 'package:copa2022/app/countries/country_store.dart';
import 'package:copa2022/app/groups/group_page.dart';
import 'package:copa2022/app/groups/group_repository_imp.dart';
import 'package:copa2022/app/groups/group_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase/supabase.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => SupabaseClient(Constants.supabaseUrl, Constants.supabaseKey),
        ),
        Bind((i) => CountryRepositoryImp()),
        Bind((i) => CountryStore(i())),
        Bind((i) => GroupRepositoryImp()),
        Bind((i) => GroupStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const GroupPage()),
        ChildRoute('/groups', child: (context, args) => const GroupPage()),
        ChildRoute('/countries', child: (context, args) => const CountryPage()),
      ];
}
