import 'package:flutter/material.dart';
import 'package:respiration/diets/diets.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/imt/widgetsImt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'package:respiration/recipe/recipe.dart';
import 'package:respiration/weather/weather.dart';

import '../home.dart';

class Imt extends StatefulWidget {
  @override
  _ImtState createState() => _ImtState();
}

class _ImtState extends State<Imt> {
  final controllerWeight = TextEditingController();
  final controllerHeight = TextEditingController();
  String tipResult;
  String stepenIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Индекс Массы Тела',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[300],
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  'Н А В И Г А Ц И Я',
                  style: TextStyle(fontSize: 30),
                ),
              )),
              ListTile(
                title: Text(
                  'Система дыхания',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'ЭКГ: ЧСС и ЭОС',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Ecg(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'ЭКГ: Интервалы и Зубцы',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intervals(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'Индекс массы тела',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Imt(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'Рецепты',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Recipe(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'Погода',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Weather(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  'Диеты(столы)',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Diets(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tipResult != null)
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      tipResult,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    if (stepenIndex != null)
                      Text(
                        stepenIndex,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                  ],
                ),
              ),
            Text("ИНДЕКС МАССЫ ТЕЛА"),
            sizedBox(controllerWeight, "Вес"),
            sizedBox(controllerHeight, "Рост"),
            SizedBox(height: 15),
            FlatButton(
              onPressed: calculateTip,
              child: Text("Рассчитать"),
              color: Colors.deepPurple[300],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void calculateTip() {
    final weight = int.parse(controllerWeight.text);
    final height = int.parse(controllerHeight.text);
    final result = (weight / (height * height) * 10000).toStringAsFixed(2);
    final resultInt = (weight / (height * height) * 10000);
    String stepen;
    if (resultInt < 18.5)
      stepen = "Недостаточный вес";
    else if (resultInt >= 25.00 && resultInt < 30.00)
      stepen = "Излишний вес";
    else if (resultInt >= 30.00 && resultInt < 35)
      stepen = "Ожирение I степени";
    else if (resultInt >= 35.00 && resultInt < 40)
      stepen = "Ожирение II степени";
    else if (resultInt >= 40)
      stepen = "Ожирение III степени";
    else
      stepen = "Нормальный вес";

    setState(() {
      tipResult = '$result';
      stepenIndex = '$stepen';
    });
  }
}
