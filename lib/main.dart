import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'Model/element.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'Widget/AppBar.dart';
import 'Widget/BoxDecoration.dart';
import 'Widget/InkWell.dart';
import 'Widget/SizedBox.dart';
import 'Widget/Text.dart';

void main() {
  runApp(MyApp());
}

const paddingEdgeInsets = EdgeInsets.all(20.0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Elemntos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Elementos',
      style: optionStyle,
    ),
    Text(
      'Index 1: Acerca de Mi',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Elemntos')));
          break;
        case 1:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => About(title: 'Acerca de Mi')));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar("Elements"),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ElementDataModel>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child:
                                          Text(items[index].symbol.toString()),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ElementMock(items![index])));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Elementos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Acerca de Mi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ElementMock extends StatelessWidget {
  final ElementDataModel? obj;
  ElementMock(this.obj);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar(obj!.name.toString()),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var app = obj;
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: CreateText(
                        "Su numero de elemnto es: ${app!.number.toString()}",
                        Colors.black),
                  ),
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: CreateText(
                        "Es un elemento de tipos :${app!.category.toString()}",
                        Colors.black),
                  ),
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: CreateText(
                        "Su letra es: ${app!.symbol.toString()}", Colors.black),
                  ),
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: CreateText(app!.summary.toString(), Colors.black),
                  ),
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: CreateText(
                        "Fue descubiero por :${app!.discovered_by.toString()}",
                        Colors.black),
                  ),
                  CreateSpaceWithSizeBox(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: Colors.white),
                    child: CreateInkWell(
                        "Mas Informacion", Colors.blue, app!.source.toString()),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class About extends StatefulWidget {
  About({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _About createState() => _About();
}

class _About extends State<About> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Elementos',
      style: optionStyle,
    ),
    Text(
      'Index 1: Acerca de Mi',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Elemntos')));
          break;
        case 1:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => About(title: 'Acerca de Mi')));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar("Acerca de Mi"),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingEdgeInsets,
          child: Center(
            child: Column(
              children: [
                Container(
                  child: CreateText("Gilbert Samill Rivas", Colors.blue),
                ),
                CreateSpaceWithSizeBox(),
                Container(
                  decoration: CreateBoxDecoration("assets/pic.jpg"),
                ),
                CreateText(
                    "Hola Mi nombre es Gilbert Samill Rivas, desarrollador de software con mas de dos years de experiencia con conocimineto sen tecnologias y lenguajes de programcion tales como son c#, flutter, MVC, MVVM, N Layers architec, etc..",
                    Colors.black),
                CreateSpaceWithSizeBox(),
                Container(
                  child: CreateInkWell("Mi Contacto en Linkedin", Colors.blue,
                      "https://www.linkedin.com/in/gilbert-samill-rivas-encarnacion-a6023617a/"),
                ),
                CreateSpaceWithSizeBox(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Elementos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Acerca de Mi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

Future<List<ElementDataModel>> ReadJsonData() async {
  final jsonData =
      await rootBundle.rootBundle.loadString('assets/elementos.json');
  final list = json.decode(jsonData) as List<dynamic>;

  return list.map((e) => ElementDataModel.fromJson(e)).toList();
}
