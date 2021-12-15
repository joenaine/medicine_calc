import 'package:flutter/material.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'package:respiration/recipe/recipe.dart';
import 'package:respiration/weather/weather.dart';

import 'diets/diets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String equalTo;
  String equalToOfv;
  String obratimost1;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Система Дыхания',
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Индекс Курильщика',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: controller1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller1.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'сиг/день',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelStyle: TextStyle(fontSize: 18)),
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: controller2,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller2.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'годы',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: calculate,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                'Посчитать',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          if (equalTo != null)
            Text(
              equalTo,
              style: TextStyle(fontSize: 26),
            ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Коэффициент бронходилатации (ОФВ1)',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: controller3,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller4.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'до',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelStyle: TextStyle(fontSize: 18)),
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: controller4,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller4.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'после',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: calculate1,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                'Посчитать',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          if (equalToOfv != null)
            Text(
              equalToOfv,
              style: TextStyle(fontSize: 26),
            ),
          if (obratimost1 != null)
            Text(
              obratimost1,
              style: TextStyle(fontSize: 26),
            ),
        ],
      ),
    );
  }

  void calculate() {
    final sigarety = int.parse(controller1.text.trim());
    final years = int.parse(controller2.text.trim());
    final result = (sigarety * years) / 20;

    setState(() {
      equalTo = '$result';
    });
  }

  void calculate1() {
    final doOfv = int.parse(controller3.text.trim());
    final posleOfv = int.parse(controller4.text.trim());
    final result = (posleOfv - doOfv) / doOfv;
    String obratimost;
    if (result * 100 >= 12)
      obratimost = 'Обратимая бронхообструкция';
    else
      obratimost = 'Необратимая бронхообструкция';
    setState(() {
      equalToOfv = '${result * 100}';
      obratimost1 = obratimost;
    });
  }
}
