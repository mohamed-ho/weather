import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Services/getdate.dart';
import 'package:weather/provider/weatherProvider.dart';
import 'package:weather/screens/home_widget.dart';
import 'package:weather/screens/search.dart';
import 'package:weather/screens/test_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeWidgetConfig.initialize().then((value) async {
        callApiAndUpdateUI();
      });
    });
    super.initState();
  }

  callApiAndUpdateUI() async {
    Provider.of<WeatherProvider>(context, listen: false).weather =
        await GetData().fetchWeatherByCity('sohag');
    HomeWidgetConfig.update(context,
        HomeWidget(weather: Provider.of<WeatherProvider>(context).weather!));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Provider.of<WeatherProvider>(context).weather == null
              ? Colors.white
              : Provider.of<WeatherProvider>(context).weather!.getColor(),
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Provider.of<WeatherProvider>(context).weather == null
            ? const Center(
                child: Text(
                  'There is no weather 😌 start to search now 🔎',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: Provider.of<WeatherProvider>(context).weather ==
                                null
                            ? [Colors.white]
                            : [
                                Provider.of<WeatherProvider>(context)
                                    .weather!
                                    .getColor(),
                                Provider.of<WeatherProvider>(context)
                                    .weather!
                                    .getColor()[100],
                              ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      '${Provider.of<WeatherProvider>(context).city}',
                      style: const TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'update : ${DateTime.now().hour} : ${DateTime.now().minute} ',
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Image.network('https:${Provider.of<WeatherProvider>(context).weather!.icon}',width: 100,),
                        Text(
                          '${Provider.of<WeatherProvider>(context).weather!.temp}',
                          style: const TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                                'maxTemp : ${Provider.of<WeatherProvider>(context).weather!.maxTemp}'),
                            Text(
                                'minTemp : ${Provider.of<WeatherProvider>(context).weather!.minTemp}'),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      Provider.of<WeatherProvider>(context)
                          .weather!
                          .description,
                      style: const TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              ));
  }
}
