import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({
    Key? key,
    required this.currentPageName,
  }) : super(key: key);

  final String currentPageName;

  final Map<String, int> _map = {
    'groups': 0,
    'countries': 1,
  };

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      currentIndex: _map[currentPageName] ?? 0,
      onTap: (page) => Modular.to.navigate(
          '/${_map.keys.firstWhere((key) => _map[key] == page, orElse: () => 'groups')}'),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_sharp),
          label: "Classificação",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_motion_sharp),
          label: "Seleções",
        ),
      ],
    );
  }
}
