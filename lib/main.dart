import 'package:flutter/material.dart';
import 'package:flutter_weather/weather.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
  //runApp(Text("Hello World"));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CIS 3334 Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Daily> dailyWeather = [];

  Future<List<Daily>> _getListItems() async {
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=46.8&lon=-92.1&exclude=hourly,current,minutely,alerts&units=imperial&appid=b15632ec4a9f1a874aeb15b3e22c4503');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<Daily> newDaily = weatherFromJson(response.body).daily;
      return newDaily;
    } else {
      print("HTTP Error with code ${response.statusCode}");
      return dailyWeather;
    }
  }

  @override
  initState() {
    super.initState();
    _getListItems().then((newDaily) {
      setState(() {
        dailyWeather = newDaily;
      });
    });
  }

  Widget weatherImage(position) {
    print("description = ${dailyWeather[position].weather[0].description}");

    if(dailyWeather[position].weather[0].main == "Clouds")
      return new Image(image: AssetImage('graphics/cloud.png'));
    else if(dailyWeather[position].weather[0].main == "Drizzle")
      return new Image(image: AssetImage('graphics/drizzle.png'));
    else if(dailyWeather[position].weather[0].main == "Fog")
      return new Image(image: AssetImage('graphics/fog.png'));
    else if(dailyWeather[position].weather[0].id == 500)
      return new Image(image: AssetImage('graphics/light_rain.png'));
    else if(dailyWeather[position].weather[0].id == 801)
      return new Image(image: AssetImage('graphics/partial_cloud.png'));
    else if(dailyWeather[position].weather[0].main == "Rain")
      return new Image(image: AssetImage('graphics/rain.png'));
    else if(dailyWeather[position].weather[0].main == "Snow")
      return new Image(image: AssetImage('graphics/snow.png'));
    else
      return new Image(image: AssetImage('graphics/sun.png'));
  }

  Widget weatherTile (int position) {
    print ("Inside weatherTile and setting up tile for positon ${position}");
    return ListTile(
      leading: weatherImage(position),
      title: Text("Day ${position + 1} temp: ${dailyWeather[position].temp.day}°"),
      subtitle: Text("Wind speed: ${dailyWeather[position].windSpeed} mph"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: dailyWeather.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: weatherTile(position),
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}