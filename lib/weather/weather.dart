import 'package:flutter/material.dart';
import 'package:respiration/diets/diets.dart';
import 'package:respiration/ecg/ecg.dart';
import 'package:respiration/imt/imt.dart';
import 'package:respiration/intervaly/intervals.dart';
import 'package:respiration/recipe/recipe.dart';

import '../home.dart';
import 'data_service.dart';
import 'models.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController _cityTextController = TextEditingController();

  final _dataService = DataService();
  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Погода',
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
            if (_response != null)
              Column(children: [
                Image.network(_response.iconUrl),
                Text(
                  '${_response.tempInfo.temperature}°',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(
                  _response.weatherInfo.description,
                  style: TextStyle(fontSize: 18),
                )
              ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: _cityTextController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _cityTextController.clear();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'Город',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelStyle: TextStyle(fontSize: 18)),
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            InkWell(
              onTap: _search,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue),
                ),
                child: Text(
                  'Искать',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response =
        await _dataService.getWeather(_cityTextController.text.trim());
    setState(() {
      _response = response;
    });
  }
}
