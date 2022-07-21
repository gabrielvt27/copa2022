import 'package:copa2022/app/groups/group_country_model.dart';
import 'package:copa2022/app/groups/round_model.dart';

class GroupModel {
  GroupModel({
    required this.id,
    required this.groupName,
  });

  int id;
  String groupName;
  List<RoundModel> rounds = [];
  List<GroupCountryModel> groupCountries = [];

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] ?? 0,
      groupName: map['name'] ?? '',
    );
  }

  @override
  String toString() {
    return 'GroupModel(id: $id, groupName: $groupName, rounds: $rounds, groupCountries: $groupCountries)';
  }
}
