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
  String activeButton = 'stats';

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
                    snapshot.data.colorMap['${snapshot.data.type2}'] != null
                        ? snapshot.data.colorMap['${snapshot.data.type2}']
                            .withOpacity(0.8)
                        : snapshot.data.colorMap['${snapshot.data.type1}']
                            .withOpacity(0.7),
                    snapshot.data.colorMap['${snapshot.data.type1}']
                        .withOpacity(0.8),
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
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 5,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 7.0,
                          sigmaY: 7.0,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(1),
                            border: Border.all(
                              width: 2,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 10.0,
                    child: Container(
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
                                  color: snapshot
                                      .data.colorMap['${snapshot.data.type1}'],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
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
                                      margin: EdgeInsets.all(5.0),
                                      alignment: Alignment.center,
                                      height: 25.0,
                                      width: 58.0,
                                      decoration: BoxDecoration(
                                        color: snapshot.data
                                            .colorMap['${snapshot.data.type2}'],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.6),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        '${snapshot.data.type2}'.toUpperCase(),
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
                    ),
                  ),
                  Positioned(
                    top: -63.0,
                    left: 175.0,
                    child: Container(
                      margin: EdgeInsets.all(1.0),
                      child: Image.network(
                        snapshot.data.urlImage,
                        height: 220,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 185.0,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: snapshot
                                    .data.colorMap['${snapshot.data.type1}'],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              (snapshot.data.height / 10).toStringAsFixed(1) +
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
                                color: snapshot
                                    .data.colorMap['${snapshot.data.type1}'],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              (snapshot.data.weight / 10).toStringAsFixed(1) +
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
                                color: snapshot
                                    .data.colorMap['${snapshot.data.type1}'],
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
                    ),
                  ),
                  Positioned(
                    top: 245,
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
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
                                    : null,
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
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
                                'MOVES',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
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
                                    : null,
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
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
                                'ABILITIES ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
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
                                    : null,
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
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
                    top: 285.0,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Builder(
                        builder: (context) {
                          if (activeButton == 'stats') {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.statNameList.length,
                              itemBuilder: (ctx, index) {
                                Map<String, String> showedNames = {
                                  'hp': 'HP',
                                  'attack': 'ATK',
                                  'defense': 'DEF',
                                  'special-attack': 'SPA',
                                  'special-defense': 'SPD',
                                  'speed': 'SPE',
                                };

                                return StatsChart(
                                  label: showedNames[
                                      snapshot.data.statNameList[index].name],
                                  value: snapshot.data.baseStatList[index],
                                  percentage:
                                      snapshot.data.baseStatList[index] / 255,
                                  color: snapshot
                                      .data.colorMap['${snapshot.data.type1}'],
                                );
                              },
                            );
                          } else if (activeButton == 'abilities') {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              itemCount: snapshot.data.abilityList.length,
                              itemBuilder: (ctx, index) {
                                return Card(
                                  margin: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: snapshot.data
                                          .colorMap['${snapshot.data.type1}']
                                          .withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(3.0),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 3,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      snapshot.data.abilityList[index].name
                                          .capitalize(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.loadPokemon();
          });
        },
        elevation: 8.0,
        child: Icon(
          Icons.shuffle_rounded,
          size: 30,
        ),
      ),
    );
  }
}
