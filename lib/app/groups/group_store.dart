// ignore_for_file: avoid_print

import 'package:copa2022/app/groups/group_model.dart';
import 'package:copa2022/app/groups/igroup_repository.dart';
import 'package:flutter_triple/flutter_triple.dart';

class GroupStore extends NotifierStore<String, List<GroupModel>> {
  final IGroupRepository _groupRepository;

  GroupStore(this._groupRepository) : super([]);

  fetchGroups() async {
    setLoading(true);

    final response = await _groupRepository.getAllGroups();

    response.fold(
      (error) {
        print(error);
        setError('Falha ao carregar grupos');
      },
      (groups) => update(groups),
    );

    setLoading(false);
  }
}
