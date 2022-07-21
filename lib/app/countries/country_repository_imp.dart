import 'package:copa2022/app/countries/country_model.dart';
import 'package:copa2022/app/countries/icountry_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase/supabase.dart';

class CountryRepositoryImp implements ICountryRepositoy {
  @override
  Future<Either<Exception, List<CountryModel>>> getAllCountries() async {
    final client = Modular.get<SupabaseClient>();
    final response = await client
        .from('countries')
        .select()
        .order('nome', ascending: true)
        .execute();

    if (!response.hasError) {
      final List<CountryModel> countries =
          List.from(response.data).map((country) {
        country['bandeira'] = client.storage
            .from('images')
            .getPublicUrl('bandeiras/${country['imagename']}_bandeira.png')
            .data;
        country['escudo'] = client.storage
            .from('images')
            .getPublicUrl('escudos/${country['imagename']}_escudo.png')
            .data;
        return CountryModel.fromMap(country);
      }).toList();

      return Right(countries);
    } else {
      return Left(Exception(response.error.toString()));
    }
  }
}
