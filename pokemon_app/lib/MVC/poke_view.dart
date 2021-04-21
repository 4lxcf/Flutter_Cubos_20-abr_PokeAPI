import 'package:flutter/material.dart';
import 'package:pokemon_app/Component/pokemon.dart';
import 'package:pokemon_app/MVC/poke_controller.dart';

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
                      Text(
                        snapshot.data.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
