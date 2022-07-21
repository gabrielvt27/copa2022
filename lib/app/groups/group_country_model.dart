import 'package:copa2022/app/countries/country_model.dart';

class GroupCountryModel {
  int id;
  CountryModel country;
  String grupo;
  int pontos;
  int jogos;
  int vitorias;
  int empates;
  int derrotas;
  int gp;
  int gc;
  int sg;

  GroupCountryModel({
    required this.id,
    required this.country,
    required this.grupo,
    required this.pontos,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.gp,
    required this.gc,
    required this.sg,
  });

  factory GroupCountryModel.fromMap(Map<String, dynamic> map) {
    return GroupCountryModel(
      id: map['id']?.toInt() ?? 0,
      country: CountryModel(
        id: map['idcountry'],
        nome: map['nome'],
        imagename: map['imagename'],
      ),
      grupo: map['group'] ?? '',
      pontos: map['pontos']?.toInt() ?? 0,
      jogos: map['jogos']?.toInt() ?? 0,
      vitorias: map['vitorias']?.toInt() ?? 0,
      empates: map['empates']?.toInt() ?? 0,
      derrotas: map['derrotas']?.toInt() ?? 0,
      gp: map['gp']?.toInt() ?? 0,
      gc: map['gc']?.toInt() ?? 0,
      sg: map['sg']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'GroupCountryModel(id: $id, country: $country, grupo: $grupo, pontos: $pontos, jogos: $jogos, vitorias: $vitorias, empates: $empates, derrotas: $derrotas, gp: $gp, gc: $gc, sg: $sg)';
  }
}
