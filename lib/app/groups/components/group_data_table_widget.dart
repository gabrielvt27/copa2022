import 'package:copa2022/app/groups/group_country_model.dart';
import 'package:flutter/material.dart';

class GroupDataTableWidget extends StatelessWidget {
  GroupDataTableWidget({
    Key? key,
    required this.groupCountries,
    required this.groupName,
  }) : super(key: key);

  final List<GroupCountryModel> groupCountries;
  final String groupName;

  final List<String> titles = [
    'P',
    'J',
    'V',
    'E',
    'D',
    'GP',
    'GC',
    'SG',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GRUPO $groupName",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: size.width * .35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleColumn('Classificação'),
                  const SizedBox(
                    height: 5,
                  ),
                  ..._buildFirstCell(),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: titles
                          .map(
                            (str) => Container(
                              alignment: Alignment.center,
                              width: 30,
                              child: _buildTitleColumn(str),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ..._buildRows(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleColumn(String str) {
    return Text(
      str,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  List<Widget> _buildFirstCell() {
    List<Widget> list = [];
    for (var i = 0; i < groupCountries.length; i++) {
      list.add(
        Row(
          children: [
            Text(
              '${i + 1}',
              style: TextStyle(
                color: ((i + 1) < 3) ? const Color(0xFF8A1437) : Colors.grey,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(groupCountries[i].country.nome),
          ],
        ),
      );
    }

    return list;
  }

  List<Widget> _buildRows() {
    return groupCountries
        .map(
          (groupItem) => Row(
            children: _buildCells(groupItem),
          ),
        )
        .toList();
  }

  List<Widget> _buildCells(GroupCountryModel groupItem) {
    return [
      _cellLayout(groupItem.pontos.toString()),
      _cellLayout(groupItem.jogos.toString()),
      _cellLayout(groupItem.vitorias.toString()),
      _cellLayout(groupItem.empates.toString()),
      _cellLayout(groupItem.derrotas.toString()),
      _cellLayout(groupItem.gp.toString()),
      _cellLayout(groupItem.gc.toString()),
      _cellLayout(groupItem.sg.toString()),
    ];
  }

  Widget _cellLayout(String str) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      child: Text(str),
    );
  }
}
