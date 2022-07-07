import 'package:another_square/another_square.dart';
import 'package:another_square/square_models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SquareClient? squareClient = SquareClient(
              applicationId: 'sandbox-sq0idb-8gHyay1byds6xd-dB0Iw6g',
              clientId: 'sandbox-sq0idb-8gHyay1byds6xd-dB0Iw6g',
              clientSecret:
                  'sandbox-sq0csb-3m9WHFzmUYJOvX8BWGAi2Pdc7oQNiZT503OLXIPt8Z8');

          await squareClient.initialize();

          await squareClient.createOrder(
              authToken:
                  'EAAAEC5rEB5oloV1DvpspYLMClHBey32lMeI0if9DoN6k_kDutfmfQmKKylBF3ak',
              request: request);
        },
        tooltip: 'Create Order',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
