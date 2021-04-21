import 'package:flutter/material.dart';
import 'package:pokemon_app/Component/pokemon.dart';
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
        color: Colors.blueAccent[100],
        //padding: EdgeInsets.only(top: 10.0),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
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
                                          color: snapshot.data.colorMap[
                                              '${snapshot.data.type1}'],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        margin: EdgeInsets.all(2.0),
                                        child: Text(
                                          '${snapshot.data.type1}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
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
                                              ),
                                              margin: EdgeInsets.all(5.0),
                                              child: Text(
                                                '${snapshot.data.type2}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
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
                          //color: Colors.red,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.4,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 3.0),
                                child: FutureBuilder<Pokemon>(
                                  future: controller.pokemon,
                                  builder: (_, snapshot) {
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      return Text(
                                        'Height:     ${snapshot.data.height / 10}  m',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.4,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 3.0),
                                child: FutureBuilder<Pokemon>(
                                  future: controller.pokemon,
                                  builder: (_, snapshot) {
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      return Text(
                                        'Weight:     ${snapshot.data.weight / 10}  kg',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.4,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 3.0),
                                child: FutureBuilder<Pokemon>(
                                  future: controller.pokemon,
                                  builder: (_, snapshot) {
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return Container();
                                    } else if (snapshot.hasData) {
                                      return Text(
                                        'Base exp.:     ${snapshot.data.exp}',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                      ),
                    ],
                  ),
                ),
                FutureBuilder<Pokemon>(
                  future: controller.pokemon,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return Column(
                        children: [
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
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        '${snapshot.error}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
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
