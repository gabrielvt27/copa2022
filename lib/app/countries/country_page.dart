import 'package:copa2022/app/countries/country_model.dart';
import 'package:copa2022/app/countries/country_store.dart';
import 'package:copa2022/app/countries/widgets/country_tile_widget.dart';
import 'package:copa2022/app/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final CountryStore _countryStore = Modular.get<CountryStore>();

  @override
  void initState() {
    super.initState();
    _countryStore.fetchPaises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onChanged: _countryStore.filterCountries,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ScopedBuilder<CountryStore, Exception, List<CountryModel>>(
              store: _countryStore,
              onError: (context, error) => Text(error.toString()),
              onLoading: (context) => Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              ),
              onState: (context, countries) => Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 70,
                  ),
                  itemCount: countries.length,
                  itemBuilder: (context, index) =>
                      CountryTileWidget(country: countries[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentPageName: 'countries',
      ),
    );
  }
}
