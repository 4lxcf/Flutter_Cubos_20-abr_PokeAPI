import 'dart:ui';

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
  String activeButton = 'ss';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pokemon App'),
      ),
      body: FutureBuilder<Pokemon>(
        future: controller.pokemon,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          } else if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    snapshot.data.colorMap['${snapshot.data.type1}'],
                    snapshot.data.colorMap['${snapshot.data.type2}'] != null
                        ? snapshot.data.colorMap['${snapshot.data.type2}']
                            .withOpacity(0.5)
                        : snapshot.data.colorMap['${snapshot.data.type1}']
                            .withOpacity(0.3),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 10.0,
                    child: Container(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '# ${snapshot.data.id}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 12.0),
                                  Text(
                                    ' ${snapshot.data.name.capitalize()}',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        alignment: Alignment.center,
                                        height: 25.0,
                                        width: 58.0,
                                        decoration: BoxDecoration(
                                          color: snapshot.data.colorMap[
                                              '${snapshot.data.type1}'],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.6),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          '${snapshot.data.type1}'
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      snapshot.data.type2 != null
                                          ? Container(
                                              margin: EdgeInsets.all(5.0),
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
                                                    offset: Offset(2.0, 2.0),
                                                  ),
                                                ],
                                              ),
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
                                  ),
                                ],
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
                    top: -63.0,
                    left: 175.0,
                    child: FutureBuilder<Pokemon>(
                      future: controller.pokemon,
                      builder: (_, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container();
                        } else if (snapshot.hasData) {
                          return Container(
                            margin: EdgeInsets.all(1.0),
                            child: Image.network(
                              snapshot.data.urlImage,
                              height: 220,
                              width: 220,
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Positioned(
                    top: 185.0,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: FutureBuilder<Pokemon>(
                      future: controller.pokemon,
                      builder: (_, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container();
                        } else if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HEIGHT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    (snapshot.data.height / 10)
                                            .toStringAsFixed(1) +
                                        ' m',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'WEIGHT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    (snapshot.data.weight / 10)
                                            .toStringAsFixed(1) +
                                        ' kg',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BASE EXPERIENCE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Row(
                                    children: [
                                      Text(
                                        (snapshot.data.exp.toString()),
                                        style: TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Positioned(
                    top: 265,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  activeButton = 'stats';
                                });
                              },
                              child: Text(
                                'STATS',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: activeButton == 'stats'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: activeButton == 'stats'
                                    ? MaterialStateProperty.all<Color>(snapshot
                                        .data
                                        .colorMap['${snapshot.data.type1}'])
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  activeButton = 'evolutions';
                                });
                              },
                              child: Text(
                                'EVOLUTIONS',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: activeButton == 'evolutions'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: activeButton == 'evolutions'
                                    ? MaterialStateProperty.all<Color>(snapshot
                                        .data
                                        .colorMap['${snapshot.data.type1}'])
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  activeButton = 'abilities';
                                });
                              },
                              child: Text(
                                'ABILITES ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: activeButton == 'abilities'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: activeButton == 'abilities'
                                    ? MaterialStateProperty.all<Color>(snapshot
                                        .data
                                        .colorMap['${snapshot.data.type1}'])
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Container();
                          } else if (snapshot.hasData) {
                            if (activeButton == 'stats') {
                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    StatsChart(
                                      label: 'HP',
                                      value: snapshot.data.hpStat,
                                      percentage: snapshot.data.hpStat / 255,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                    StatsChart(
                                      label: 'ATK',
                                      value: snapshot.data.atkStat,
                                      percentage: snapshot.data.atkStat / 190,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                    StatsChart(
                                      label: 'DEF',
                                      value: snapshot.data.defStat,
                                      percentage: snapshot.data.defStat / 250,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                    StatsChart(
                                      label: 'SPA',
                                      value: snapshot.data.spaStat,
                                      percentage: snapshot.data.spaStat / 194,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                    StatsChart(
                                      label: 'SPD',
                                      value: snapshot.data.spdStat,
                                      percentage: snapshot.data.spdStat / 250,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                    StatsChart(
                                      label: 'SPE',
                                      value: snapshot.data.speStat,
                                      percentage: snapshot.data.speStat / 200,
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}'],
                                    ),
                                  ]);
                            } else if (activeButton == 'abilities') {
                              return Container(
                                height: 100,
                                width: 100,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  itemCount: snapshot.data.abilities.length,
                                  itemBuilder: (ctx, index) {
                                    return Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: snapshot.data.colorMap[
                                                '${snapshot.data.type1}'],
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Text(
                                          snapshot.data.abilities[index].name
                                              .capitalize(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              color: Color.fromRGBO(0, 245, 255, 1),
              alignment: Alignment.center,
            );
          }
        },
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
