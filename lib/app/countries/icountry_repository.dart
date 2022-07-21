import 'package:copa2022/app/countries/country_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICountryRepositoy {
  Future<Either<Exception, List<CountryModel>>> getAllCountries();
}
