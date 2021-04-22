import 'package:flutter/material.dart';
import 'package:pokemon_app/Components/pokemon.dart';
import 'package:pokemon_app/Components/stats_chart.dart';
import 'package:pokemon_app/MVC/poke_controller.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class PokeView extends StatefulWidget {
  PokeView({Key key}) : super(key: key);

  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokemon App'),
      ),
      body: Container(
        color: Color.fromRGBO(0, 245, 255, 1),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.yellow[50],
                border: Border.all(
                  color: Color.fromRGBO(0, 195, 255, 1),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 0.72,
              child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<Pokemon>(
                  future: controller.pokemon,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container();
                    } else if (snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.all(1.0),
                        child: Text(
                          '#${snapshot.data.id} ' +
                              ' ${snapshot.data.name.capitalize()}',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: FutureBuilder<Pokemon>(
                          future: controller.pokemon,
                          builder: (_, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Container();
                            } else if (snapshot.hasData) {
                              return Container(
                                margin: EdgeInsets.all(1.0),
                                child: Image.network(
                                  snapshot.data.urlImage,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: FutureBuilder<Pokemon>(
                          future: controller.pokemon,
                          builder: (_, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Container();
                            } else if (snapshot.hasData) {
                              return Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25.0,
                                    width: 58.0,
                                    decoration: BoxDecoration(
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.6),
                                            blurRadius:
                                                5.0, // soften the shadow
                                            spreadRadius:
                                                1.0, //extend the shadow
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            )),
                                      ],
                                    ),
                                    margin: EdgeInsets.all(2.0),
                                    child: Text(
                                      '${snapshot.data.type1}'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  snapshot.data.type2 != null
                                      ? Container(
                                          alignment: Alignment.center,
                                          height: 25.0,
                                          width: 58.0,
                                          decoration: BoxDecoration(
                                            color: snapshot.data.colorMap[
                                                '${snapshot.data.type2}'],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(
                                                    2.0,
                                                    2.0,
                                                  )),
                                            ],
                                          ),
                                          margin: EdgeInsets.all(5.0),
                                          child: Text(
                                            '${snapshot.data.type2}'
                                                .toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: FutureBuilder<Pokemon>(
                            future: controller.pokemon,
                            builder: (_, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Container();
                              } else if (snapshot.hasData) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5.0),
                                  decoration: BoxDecoration(
                                    color: snapshot.data
                                        .colorMap['${snapshot.data.type1}'],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'Height:     ${snapshot.data.height / 10}  m',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        Card(
                          child: FutureBuilder<Pokemon>(
                            future: controller.pokemon,
                            builder: (_, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Container();
                              } else if (snapshot.hasData) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5.0),
                                  decoration: BoxDecoration(
                                    color: snapshot.data
                                        .colorMap['${snapshot.data.type1}'],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'Weight:     ${snapshot.data.weight / 10}  kg',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        Card(
                          child: FutureBuilder<Pokemon>(
                            future: controller.pokemon,
                            builder: (_, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Container();
                              } else if (snapshot.hasData) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5.0),
                                  decoration: BoxDecoration(
                                    color: snapshot.data
                                        .colorMap['${snapshot.data.type1}'],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'Base exp.:     ${snapshot.data.exp}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              child: Text(
                'Stats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.75,
                child: FutureBuilder<Pokemon>(
                  future: controller.pokemon,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container();
                    } else if (snapshot.hasData) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StatsChart(
                              label: 'HP',
                              value: snapshot.data.hpStat,
                              percentage: snapshot.data.hpStat / 255,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                            StatsChart(
                              label: 'ATK',
                              value: snapshot.data.atkStat,
                              percentage: snapshot.data.atkStat / 190,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                            StatsChart(
                              label: 'DEF',
                              value: snapshot.data.defStat,
                              percentage: snapshot.data.defStat / 250,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                            StatsChart(
                              label: 'SPA',
                              value: snapshot.data.spaStat,
                              percentage: snapshot.data.spaStat / 194,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                            StatsChart(
                              label: 'SPD',
                              value: snapshot.data.spdStat,
                              percentage: snapshot.data.spdStat / 250,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                            StatsChart(
                              label: 'SPE',
                              value: snapshot.data.speStat,
                              percentage: snapshot.data.speStat / 200,
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                            ),
                          ]);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),

            // **Botões de PROXIMO POKEMON e POKEMON ANTERIOR
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ElevatedButton(
            //       child: Icon(Icons.chevron_left_rounded),
            //       onPressed: () {
            //         setState(() {
            //           controller.previousPokemon();
            //         });
            //       },
            //       style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(snapshot
            //                 .data
            //                 .colorMap['${snapshot.data.type1}']),
            //         shape: MaterialStateProperty.all<
            //                 RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(25.0),
            //         )),
            //         elevation: MaterialStateProperty.all(8.0),
            //       ),
            //     ),
            //     ElevatedButton(
            //       child: Icon(Icons.chevron_right_rounded),
            //       onPressed: () {
            //         setState(() {
            //           controller.nextPokemon();
            //         });
            //       },
            //       style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(snapshot
            //                 .data
            //                 .colorMap['${snapshot.data.type1}']),
            //         shape: MaterialStateProperty.all<
            //                 RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(25.0),
            //         )),
            //         elevation: MaterialStateProperty.all(10.0),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.loadPokemon();
          });
        },
        elevation: 8.0,
        child: Icon(Icons.shuffle_rounded),
      ),
    );
  }
}
