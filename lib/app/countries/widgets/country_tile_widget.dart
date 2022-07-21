import 'package:copa2022/app/countries/country_model.dart';
import 'package:flutter/material.dart';

class CountryTileWidget extends StatelessWidget {
  const CountryTileWidget({
    Key? key,
    required this.country,
  }) : super(key: key);

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFF8A1437),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .15,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(2, 2)),
                ],
              ),
              child: Image.network(
                country.bandeira!,
                fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            Text(
              country.nome,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
