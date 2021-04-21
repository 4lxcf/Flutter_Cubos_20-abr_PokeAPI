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
        title: Text('Pokemon App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle_rounded),
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: Icon(Icons.chevron_left_rounded),
                            onPressed: () {
                              setState(() {
                                controller.previousPokemon();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  snapshot
                                      .data.colorMap['${snapshot.data.type1}']),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                              elevation: MaterialStateProperty.all(10.0),
                            ),
                          ),
                          Image.network(
                            snapshot.data.urlImage,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          ElevatedButton(
                            child: Icon(Icons.chevron_right_rounded),
                            onPressed: () {
                              setState(() {
                                controller.nextPokemon();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  snapshot
                                      .data.colorMap['${snapshot.data.type1}']),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                              elevation: MaterialStateProperty.all(10.0),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          '#${snapshot.data.id} ' +
                              ' ${snapshot.data.name.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 25.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              color: snapshot
                                  .data.colorMap['${snapshot.data.type1}'],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              '${snapshot.data.type1.capitalize()}',
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
                                    color: snapshot.data
                                        .colorMap['${snapshot.data.type2}'],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  margin: EdgeInsets.all(5.0),
                                  child: Text(
                                      '${snapshot.data.type2.capitalize()}'),
                                )
                              : Container(),
                        ],
                      ),
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
