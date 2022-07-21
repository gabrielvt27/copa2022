import 'package:copa2022/app/groups/match_model.dart';

class RoundModel {
  int id;
  String round;
  List<MatchModel> matches = [];

  RoundModel({
    required this.id,
    required this.round,
  });

  factory RoundModel.fromMap(Map<String, dynamic> map) {
    return RoundModel(
      id: map['idround'].toInt() ?? 0,
      round: map['round'] ?? '',
    );
  }

  @override
  String toString() => 'RoundModel(id: $id, round: $round, matches: $matches)';
}
