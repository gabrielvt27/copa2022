import 'package:copa2022/app/countries/country_model.dart';
import 'package:copa2022/app/countries/icountry_repository.dart';
import 'package:flutter_triple/flutter_triple.dart';

// ignore: must_be_immutable
class CountryStore extends NotifierStore<Exception, List<CountryModel>> {
  final ICountryRepositoy _countryRepositoy;

  CountryStore(this._countryRepositoy) : super([]);

  List<CountryModel> _countries = [];

  fetchPaises() async {
    setLoading(true);

    final response = await _countryRepositoy.getAllCountries();

    response.fold(
      (error) => setError(error),
      (success) {
        _countries = success;
        update(_countries);
      },
    );

    setLoading(false);
  }

  filterCountries(String str) {
    if (str.trim().isEmpty) {
      update(_countries);
    } else {
      str = str.toLowerCase();
      final newList = _countries
          .where((country) => country.nome.toLowerCase().contains(str))
          .toList();

      update(newList);
    }
  }
}
