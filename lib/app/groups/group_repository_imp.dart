import 'package:copa2022/app/groups/group_country_model.dart';
import 'package:copa2022/app/groups/group_model.dart';
import 'package:copa2022/app/groups/igroup_repository.dart';
import 'package:copa2022/app/groups/match_model.dart';
import 'package:copa2022/app/groups/round_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase/supabase.dart';

class GroupRepositoryImp implements IGroupRepository {
  @override
  Future<Either<Exception, List<GroupModel>>> getAllGroups() async {
    List<GroupModel> groups = [];

    final client = Modular.get<SupabaseClient>();

    final groupCountriesResponse =
        await client.from('vwgroupcountries').select().execute();

    if (groupCountriesResponse.hasError) {
      return Left(Exception(groupCountriesResponse.error.toString()));
    }

    for (var groupCountry in List.from(groupCountriesResponse.data)) {
      GroupModel group = groups.firstWhere(
        (group) => group.id == groupCountry['idgroup'],
        orElse: () {
          final newGroup = GroupModel(
            id: groupCountry['idgroup'],
            groupName: groupCountry['group'],
          );
          groups.add(newGroup);
          return newGroup;
        },
      );

      group.groupCountries.add(GroupCountryModel.fromMap(groupCountry));
    }

    final groupMatchesResponse =
        await client.from('vwgroupmatches').select().execute();

    if (groupMatchesResponse.hasError) {
      return Left(Exception(groupMatchesResponse.error.toString()));
    }

    for (var groupMatch in List.from(groupMatchesResponse.data)) {
      GroupModel group =
          groups.firstWhere((group) => group.id == groupMatch['idgroup']);

      RoundModel round = group.rounds.firstWhere(
        (round) => round.id == groupMatch['idround'],
        orElse: () {
          final newRound = RoundModel(
            id: groupMatch['idround'],
            round: groupMatch['round'],
          );
          group.rounds.add(newRound);
          return newRound;
        },
      );

      groupMatch['homebandeira'] = client.storage
          .from('images')
          .getPublicUrl('bandeiras/${groupMatch['homeimagename']}_bandeira.png')
          .data;
      groupMatch['awaybandeira'] = client.storage
          .from('images')
          .getPublicUrl('bandeiras/${groupMatch['awayimagename']}_bandeira.png')
          .data;

      round.matches.add(MatchModel.fromMap(groupMatch));
    }

    return Right(groups);
  }
}
