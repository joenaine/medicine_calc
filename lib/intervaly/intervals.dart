import 'package:flutter/material.dart';
import 'package:respiration/diets/diets.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/home.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/widgetsIntervals.dart';
import 'package:respiration/recipe/recipe.dart';
import 'package:respiration/weather/weather.dart';

class Intervals extends StatefulWidget {
  @override
  _IntervalsState createState() => _IntervalsState();
}

TextEditingController pInterval = TextEditingController();
TextEditingController pqInterval = TextEditingController();
TextEditingController qrsInterval = TextEditingController();
TextEditingController tInterval = TextEditingController();
TextEditingController qtInterval = TextEditingController();
TextEditingController rrInterval = TextEditingController();
String p25;
String pq25;
String qrs25;
String t25;
String qt25;
String rr25;
String p50;
String pq50;
String qrs50;
String t50;
String qt50;
String rr50;

class _IntervalsState extends State<Intervals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('P'),
                sizedBox(pInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      pInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150, child: p25 != null ? textWidth(p25, p50) : null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('PQ'),
                sizedBox(pqInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      pqInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150,
                    child: pq25 != null ? textWidth(pq25, pq50) : null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('QRS'),
                sizedBox(qrsInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      qrsInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150,
                    child: qrs25 != null ? textWidth(qrs25, qrs50) : null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('T'),
                sizedBox(tInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      tInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150, child: t25 != null ? textWidth(t25, t50) : null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('QT'),
                sizedBox(qtInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      qtpInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150,
                    child: qt25 != null ? textWidth(qt25, qt50) : null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                container('R-R'),
                sizedBox(rrInterval, 'N'),
                ElevatedButton(
                    onPressed: () {
                      rrInt25();
                    },
                    child: Text('Перевести')),
                SizedBox(
                    width: 150,
                    child: rr25 != null ? textWidth(rr25, rr50) : null)
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text('P=0.06 - 0.11', style: textStyle()),
                  Text('PQ=0.12 - 0.20', style: textStyle()),
                  Text('QRS=0.06 - 0.1', style: textStyle()),
                  Text('T=0.05 - 0.25', style: textStyle()),
                  Text('QT=0.27 - 0.44', style: textStyle()),
                  Text('R-R = 0.8', style: textStyle()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void pInt25() {
    final resultP25 = double.parse(pInterval.text.trim()) * 0.04;
    final resultP50 = double.parse(pInterval.text.trim()) * 0.02;

    setState(() {
      p25 = '$resultP25';
      p50 = '$resultP50';
    });
  }

  void pqInt25() {
    final resultPQ25 = double.parse(pqInterval.text.trim()) * 0.04;
    final resultPQ50 = double.parse(pqInterval.text.trim()) * 0.02;
    setState(() {
      pq25 = '$resultPQ25';
      pq50 = '$resultPQ50';
    });
  }

  void qrsInt25() {
    final resultQRS25 = double.parse(qrsInterval.text.trim()) * 0.04;
    final resultQRS50 = double.parse(qrsInterval.text.trim()) * 0.02;
    setState(() {
      qrs25 = '$resultQRS25';
      qrs50 = '$resultQRS50';
    });
  }

  void tInt25() {
    final resultT25 = double.parse(tInterval.text.trim()) * 0.04;
    final resultT50 = double.parse(tInterval.text.trim()) * 0.02;
    setState(() {
      t25 = '$resultT25';
      t50 = '$resultT50';
    });
  }

  void qtpInt25() {
    final resultQT25 = double.parse(qtInterval.text.trim()) * 0.04;
    final resultQT50 = double.parse(qtInterval.text.trim()) * 0.02;
    setState(() {
      qt25 = '$resultQT25';
      qt50 = '$resultQT50';
    });
  }

  void rrInt25() {
    final resultRR25 = double.parse(rrInterval.text.trim()) * 0.04;
    final resultRR50 = double.parse(rrInterval.text.trim()) * 0.02;
    setState(() {
      rr25 = '$resultRR25';
      rr50 = '$resultRR50';
    });
  }
}
