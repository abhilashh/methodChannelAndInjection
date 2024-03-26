import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:batterylevel/data/model/birdModel.dart';
import 'package:batterylevel/data/model/quote.dart';
import 'package:batterylevel/data/repositiory/quote_repository.dart';
import 'package:batterylevel/service/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class MyQuotePage extends StatefulWidget {
  const MyQuotePage({super.key});

  @override
  State<MyQuotePage> createState() => _MyQuotePageState();
}

class _MyQuotePageState extends State<MyQuotePage> {
  final String _batteryLevel = 'Unknown battery level.';
  final String _bluetoothStatus = 'Bluetooth status: ';
  final String _bleState = 'not';
  static const platform = MethodChannel('samples.flutter.dev/battery');
  // static const blueplatform = MethodChannel('samples.flutter.dev/bluetooth');
  late QuoteRepository _quoteRepository;
  final streamController = StreamController<String>();
  ValueNotifier<String> channelValue = ValueNotifier<String>('CLOSE');

  @override
  void initState() {
    _quoteRepository = locator.get<QuoteRepository>(param1: "testing");
    //  Timer.periodic(Duration(seconds: 1), (timer) async {
    //    _getBatteryLevel();
    //    // streamController.add(await platform.invokeMethod('getBluetoothState'));
    //  });
    // streamController.stream.listen((event) {
    //   print(event);
    // });
    super.initState();
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel = '';
    String blueStatus = '';
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    try {
      final result2 = await platform.invokeMethod('getBluetoothState');
      blueStatus = 'Bluetooth status $result2';
    } on PlatformException catch (e) {
      blueStatus = "error in bluetooth: '${e.message}'.";
    }
    channelValue.value = "$batteryLevel, $blueStatus";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('fdsfs'),
        ),
        // body: Center(
        //   child: FutureBuilder<List<Quote>>(
        //       future: _quoteRepository.getQuotes(),
        //       builder: (context, AsyncSnapshot<List<Quote>> snapData) {
        //         if (snapData.connectionState == ConnectionState.waiting) {
        //           return Center(child: Text('Please wait its loading...'));
        //         } else {
        //           if (snapData.hasError)
        //             return Center(child: Text('Error: ${snapData.error}'));
        //           else
        //             return ListView.builder(
        //               itemCount: snapData.data?.length,
        //               itemBuilder: (context, index) =>
        //                   _quoteItem(snapData.data![index], index),
        //             );
        //         }
        //       }),
        // ));
        body: Center(
          child: FutureBuilder<List<BirdModel>>(
              future: _quoteRepository.getBird(),
              builder: (context, AsyncSnapshot<List<BirdModel>> snapData) {
                if (snapData.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: Text('Please wait its loading...'));
                } else {
                  if (snapData.hasError) {
                    return Center(child: Text('Error: ${snapData.error}'));
                  } else {
                    return Stack(
                      children: [
                        SizedBox(
                          child: ListView.builder(
                            itemCount: snapData.data?.length,
                            itemBuilder: (context, index) =>
                                _birdItem(snapData.data![index], index),
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: channelValue,
                            builder: (context, child, _) {
                              return ElevatedButton(
                                  onPressed: () {
                                    _getBatteryLevel();
                                    locator
                                        .get<SharedPreferences>()
                                        .setBool("hi", false);
                                    Future.delayed(const Duration(seconds: 5),
                                        () async {
                                      bool? value = locator
                                          .get<SharedPreferences>()
                                          .getBool("hi");
                                      print("its value.......$value");
                                    });
                                  },
                                  child: Text(channelValue.value));
                            })
                      ],
                    );
                  }
                }
              }),
        ));
  }

  Widget _quoteItem(Quote item, index) {
    return ListTile(
      tileColor: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1),
      title: Text(
        '"${item.quote}"',
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('- ${item.author}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }

  Widget _birdItem(BirdModel item, index) {
    return ListTile(
      tileColor: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1),
      title: Text(
        '"${item.name}"',
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('- ${item.description}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }
}
