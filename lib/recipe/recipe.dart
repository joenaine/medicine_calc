import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:respiration/diets/diets.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'dart:convert' as convert;

import 'package:respiration/recipe/model.dart';
import 'package:respiration/weather/weather.dart';

import '../home.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get(
        "https://script.google.com/macros/s/AKfycbyrEW1faBcyXW5R241IHortf3IPrv2OfN1AbDOZl_zjJCx2oi4/exec");
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.name.contains(text) ||
          f.rec.contains(text) ||
          f.name.toLowerCase().contains(text.toLowerCase()) ||
          f.rec.toLowerCase().contains(text.toLowerCase())) _search.add(f);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Поиск Рецептов',
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
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.deepPurple[300],
            child: Card(
              child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    hintText: 'Поиск рецепта на лекарство',
                    border: InputBorder.none,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.clear();
                    onSearch('');
                  },
                  icon: Icon(Icons.cancel),
                ),
              ),
            ),
          ),
          loading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: _search.length != 0 || controller.text.isNotEmpty
                      ? ListView.builder(
                          itemCount: _search.length,
                          itemBuilder: (context, i) {
                            final b = _search[i];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 6),
                              child: Column(
                                children: [
                                  Text(
                                    b.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    b.rec,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (context, i) {
                            final a = _list[i];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 6),
                              child: Column(
                                children: [
                                  Text(
                                    a.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    a.rec,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
        ],
      )),
    );
  }
}
