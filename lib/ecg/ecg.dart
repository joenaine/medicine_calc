import 'package:flutter/material.dart';
import 'package:respiration/diets/diets.dart';
import 'package:respiration/ecg/widgets.dart';
import 'package:respiration/home.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'package:respiration/recipe/recipe.dart';
import 'package:respiration/weather/weather.dart';

class Ecg extends StatefulWidget {
  @override
  _EcgState createState() => _EcgState();
}

class _EcgState extends State<Ecg> {
  final control25 = TextEditingController();
  final control50 = TextEditingController();
  String tip25Result;
  String tip50Result;
  String osSerdca;

  List services = [
    '1',
    '2',
    '3',
  ];
  int selectedService = -1;
  int firstOtv = -1;
  int secondOtv = -1;
  int thirdOtv = -1;
  int fourthOtv = -1;
  int fifthOtv = -1;
  int sixthOtv = -1;
  int seventhOtv = -1;
  int eighthOtv = -1;
  int ninthOtv = -1;

  String pervoeOtvedenie;
  String vtoroeOtvedenie;
  String tretyeOtvedenie;
  numBers(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (firstOtv == index)
            firstOtv = -1;
          else
            firstOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: firstOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color:
                firstOtv == index ? Colors.blue : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers2(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (secondOtv == index)
            secondOtv = -1;
          else
            secondOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              secondOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: secondOtv == index
                ? Colors.blue
                : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers3(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (thirdOtv == index)
            thirdOtv = -1;
          else
            thirdOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: thirdOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color:
                thirdOtv == index ? Colors.blue : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers4(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (fourthOtv == index)
            fourthOtv = -1;
          else
            fourthOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              fourthOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: fourthOtv == index
                ? Colors.blue
                : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers5(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (fifthOtv == index)
            fifthOtv = -1;
          else
            fifthOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: fifthOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color:
                fifthOtv == index ? Colors.blue : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers6(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (sixthOtv == index)
            sixthOtv = -1;
          else
            sixthOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: sixthOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color:
                sixthOtv == index ? Colors.blue : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers7(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (seventhOtv == index)
            seventhOtv = -1;
          else
            seventhOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              seventhOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: seventhOtv == index
                ? Colors.blue
                : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers8(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (eighthOtv == index)
            eighthOtv = -1;
          else
            eighthOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              eighthOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color: eighthOtv == index
                ? Colors.blue
                : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  numBers9(int index, String query) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (ninthOtv == index)
            ninthOtv = -1;
          else
            ninthOtv = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ninthOtv == index ? Colors.blue.shade50 : Colors.grey.shade100,
          border: Border.all(
            color:
                ninthOtv == index ? Colors.blue : Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            query,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ЭКГ: ЧСС и ЭОС',
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
            Text(
              "ЧАСТОТА СЕРДЕЧНЫХ СОКРАЩЕНИЙ",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 200,
                  width: 120,
                  child: Column(
                    children: [
                      sizedBox(control25, "25"),
                      TextButton(
                        onPressed: calculate25tip,
                        child:
                            Text("Рассчитать", style: TextStyle(fontSize: 16)),
                      ),
                      if (tip25Result != null)
                        Text(
                          tip25Result,
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 120,
                  child: Column(
                    children: [
                      sizedBox(control50, "50"),
                      TextButton(
                        onPressed: calculate50tip,
                        child:
                            Text("Рассчитать", style: TextStyle(fontSize: 16)),
                      ),
                      if (tip50Result != null)
                        Text(
                          tip50Result,
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 140, child: texT('I Отведение')),
                    numBers(0, '1'),
                    numBers2(0, '2'),
                    numBers3(0, '3'),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 140, child: texT('II Отведение')),
                    numBers4(0, '1'),
                    numBers5(0, '2'),
                    numBers6(0, '3'),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 140, child: texT('III Отведение')),
                    numBers7(0, '1'),
                    numBers8(0, '2'),
                    numBers9(0, '3'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: ecgOs,
              child: Text(
                "Рассчитать ЭОС",
                style: TextStyle(fontSize: 20),
              ),
            ),
            if (osSerdca != null)
              Text(
                osSerdca,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void calculate25tip() {
    final cells25 = int.parse(control25.text);
    final result25 = 1500 / cells25;

    setState(() {
      tip25Result = '${result25.round()}';
    });
  }

  void calculate50tip() {
    final cells50 = int.parse(control50.text);

    final result50 = 3000 / cells50;

    setState(() {
      tip50Result = '${result50.round()}';
    });
  }

  void ecgOs() {
    final bir = firstOtv;
    final eki = secondOtv;
    final uw = thirdOtv;
    final dort = fourthOtv;
    final bes = fifthOtv;
    final jeti = seventhOtv;
    final togyz = ninthOtv;
    String vector;
    if (dort == 0 && eki == 0 && togyz == 0) {
      vector = 'Нормальное положение';
    }
    if (bir != dort && dort == jeti) {
      vector = 'Вертикальное положение';
    }
    if (bir == dort && jeti != dort) {
      vector = 'Горизонтальное положение';
    }
    if (bir == 0 && bes == 0 && togyz == 0) {
      vector = 'Отклонение влево';
    }
    if (uw == 0 && bes == 0 && jeti == 0) {
      vector = 'Отклонение вправо';
    }

    setState(() {
      osSerdca = '$vector';
    });
  }
}
