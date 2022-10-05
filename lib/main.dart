import 'package:flutter/material.dart';
import  'package:device_info_x/device_info_x.dart';
import 'package:flutter/scheduler.dart';
import 'inicio.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Info Telefono",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenidos'),
        ),
        body: Entrar(),
      ),
    );

  }
}
class Entrar extends StatefulWidget {
  const Entrar({Key? key}) : super(key: key);

  @override
  State<Entrar> createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/1.png'),
          Text(
              "\n Autor: Abraham Rojas",
              style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
          ),
          Text(
            "\n\n Descripcion del Proyecto: \n\n"
                " Obtener informacion del disposituivo, en especifico",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          Text(
            "\n MEMORIA RAM - CONECCION WIFI - NIVEL DE BATERIA ",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new Inicio();
                  }
              ));
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
}

