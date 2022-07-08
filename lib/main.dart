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
              request: CreateOrderRequest.fromJson(
                  {
                    "idempotency_key": "8193148c-9586-11e6-99f9-28cfe92138cf",
                    "order": {
                      "reference_id": "my-order-001",
                      "location_id": "LW4FWFNE6JQ0Z",
                      "line_items": [
                        {
                          "name": "New York Strip Steak",
                          "quantity": "1",
                          "base_price_money": {
                            "amount": 1599,
                            "currency": "USD"
                          }
                        },
                      ],
                      "taxes": [
                        {
                          "uid": "state-sales-tax",
                          "name": "State Sales Tax",
                          "percentage": "9",
                          "scope": "ORDER"
                        }
                      ],
                      "discounts": [
                        {
                          "uid": "labor-day-sale",
                          "name": "Labor Day Sale",
                          "percentage": "5",
                          "scope": "ORDER"
                        },
                        {
                          "uid": "one-dollar-off",
                          "name": "Sale - \$1.00 off",
                          "amount_money": {
                            "amount": 100,
                            "currency": "USD"
                          },
                          "scope": "LINE_ITEM"
                        }
                      ]
                    }
                  }
              ));
        },
        tooltip: 'Create Order',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
