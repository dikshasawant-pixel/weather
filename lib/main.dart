import 'package:flutter/material.dart';
import 'package:weather/data_service.dart';
import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: Text(
            "Weather App",
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              color: Colors.blue[900],
            ),
          ),
        ),
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response?.iconUrl ?? ""),
                    Text(
                      '${_response?.tempInfo?.temperature}°C',
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(_response?.weatherInfo?.description ?? "NA"),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                      controller: _cityTextController,
                      decoration: const InputDecoration(labelText: 'City'),
                      textAlign: TextAlign.center),
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
