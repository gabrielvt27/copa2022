import 'package:copa2022/app/countries/country_model.dart';

class MatchModel {
  CountryModel home;
  CountryModel away;
  int homeScore;
  int awayScore;
  String horario;
  String stadiumName;

  MatchModel({
    required this.home,
    required this.away,
    required this.homeScore,
    required this.awayScore,
    required this.horario,
    required this.stadiumName,
  });

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      home: CountryModel(
        id: map['idhome'],
        nome: map['homename'],
        imagename: map['homeimagename'],
        bandeira: map['homebandeira'],
        sigla: map['homesigla'],
      ),
      away: CountryModel(
        id: map['idaway'],
        nome: map['awayname'],
        imagename: map['awayimagename'],
        bandeira: map['awaybandeira'],
        sigla: map['awaysigla'],
      ),
      homeScore: map['homescore']?.toInt() ?? 0,
      awayScore: map['awayscore']?.toInt() ?? 0,
      horario: map['horario'] ?? '',
      stadiumName: map['stadiumname'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MatchModel(home: $home, away: $away, homeScore: $homeScore, awayScore: $awayScore, horario: $horario, stadiumName: $stadiumName)';
  }
}
