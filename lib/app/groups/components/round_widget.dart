import 'package:cached_network_image/cached_network_image.dart';
import 'package:copa2022/app/groups/round_model.dart';
import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget({
    Key? key,
    required this.rounds,
  }) : super(key: key);

  final List<RoundModel> rounds;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: size.height * .25,
      child: PageView.builder(
        itemCount: rounds.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Text(
                '${rounds[index].round} RODADA',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              ...rounds[index]
                  .matches
                  .map(
                    (match) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              '${match.horario} - ${match.stadiumName}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  match.home.sigla!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 113, 113, 113),
                                  ),
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl: match.home.bandeira!,
                                fit: BoxFit.fill,
                                width: 40,
                                height: 30,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 20,
                                child: Center(
                                    child: Text(
                                  match.homeScore.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.close_rounded,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 20,
                                child: Center(
                                    child: Text(
                                  match.awayScore.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                              ),
                              const Spacer(),
                              CachedNetworkImage(
                                imageUrl: match.away.bandeira!,
                                fit: BoxFit.fill,
                                width: 40,
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  match.away.sigla!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 113, 113, 113),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          );
        },
      ),
    );
  }
}
