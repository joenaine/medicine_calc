import 'package:flutter/material.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'package:respiration/recipe/recipe.dart';
import 'package:respiration/weather/weather.dart';

import '../home.dart';

class Diets extends StatefulWidget {
  @override
  _DietsState createState() => _DietsState();
}

class _DietsState extends State<Diets> {
  List diets = [
    'Язвенная болезнь желудка и 12-перстной кишки',
    'Хронический гастрит, острые гастриты, энтериты и колиты, хр. энтероколиты',
    'Запоры',
    'Заболевания кишечника с поносами',
    'Заболевания печени и желчных путей',
    'Подагра, мочекаменная болезнь с образованием камней из солей мочевой кислоты',
    'Острый и хронический нефрит (пиелонефрит, гломерулонефрит)',
    'Ожирение',
    'Сахарный диабет',
    'Заболевания сердечно-сосудистой системы с недостаточностью кровообращения',
    'Туберкулез',
    'Функциональные заболевания нервной системы',
    'Острые инфекционные заболевания',
    'Почечнокаменная болезнь с отхождением камней',
    'Различные заболевания, не требующие специальных диет',
  ];

  List additional = [
    '№1 рассчитана на долгий срок, то диету №1а назначают во время обострения язвы или гастрита, а диету №1б – в двухнедельный период затихания обострения',
    '',
    '',
    '№4 показан при острых заболеваниях кишечника и обострениях в период продолжающегося поноса. Стол № 4а показан при колитах с преобладанием процессов брожения. № 4б показан при хронических колитах в стадии затухающего обострения. № 4в показан при острых заболеваниях кишечника в период выздоровления как переход к рациональному питанию.',
    '№5 показан при заболеваниях печени, желчного пузыря, желчевыводящих путей вне стадии обострения. №5а показан при обострениях заболеваний печени, желчного пузыря и желчевыводящих путей, а также остром гепатите, холецистите, воспалениях желудочных и кишечных болезней. ',
    '',
    '№7 показан при хронических заболеваниях почек с отсутствием явлений хронической почечной недостаточности. №7а показан при острых почечных заболеваниях (нефрит острый или его обострения), почечной недостаточности. №7б показан при затихании острого воспалительного процесса в почках. Является переходным от стола №7а к столу №7.',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Диеты(столы)',
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: diets.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('${index + 1}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                title: Text(
                  diets[index].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(additional[index],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ),
            );
          },
        ),
      ),
    );
  }
}
