import 'package:copa2022/app/groups/components/group_data_table_widget.dart';
import 'package:copa2022/app/groups/group_model.dart';
import 'package:copa2022/app/groups/group_store.dart';
import 'package:copa2022/app/groups/components/round_widget.dart';
import 'package:copa2022/app/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final GroupStore _groupStore = Modular.get<GroupStore>();

  @override
  void initState() {
    super.initState();

    _groupStore.fetchGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<GroupStore, String, List<GroupModel>>(
        store: _groupStore,
        onError: (context, error) => Center(child: Text(error!)),
        onLoading: (context) => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
        ),
        onState: (context, groups) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const SizedBox(height: 30),
                  GroupDataTableWidget(
                    groupCountries: groups[index].groupCountries,
                    groupName: groups[index].groupName,
                  ),
                  RoundWidget(
                    rounds: groups[index].rounds,
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentPageName: 'groups',
      ),
    );
  }
}
