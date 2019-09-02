import 'package:flutter/material.dart';
import 'package:pagarme_flutter_card_hash/models/pagarme_card.dart';
import 'package:pagarme_flutter_card_hash/pagarme_flutter_card_hash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PagarMe Card Hash Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter PagarMe Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  String pagarmeApiKey = 'ek_test_yCRumKDVQgqFkjlQojnTSHgWw7UI5g';
  String _cardHash = "";
  TextEditingController textEditControllerCardNumber =
      new TextEditingController();
  TextEditingController textEditControllerSecurityCode =
      new TextEditingController();
  TextEditingController textEditControllerExpirationMonth =
      new TextEditingController();
  TextEditingController textEditControllerExpirationYear =
      new TextEditingController();
  TextEditingController textEditControllerCardHolderName =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditControllerCardNumber.text = '5448280000000007';
    textEditControllerSecurityCode.text = "235";
    textEditControllerExpirationMonth.text = "06";
    textEditControllerExpirationYear.text = "20";
    textEditControllerCardHolderName.text = "John Snow";
  }

  Future _generateCardHash() async {
    setState(() {
      isLoading = true;
    });

    PagarMeCard pagarMeCard = new PagarMeCard(
        cardNumber: textEditControllerCardNumber.text,
        cardExpirationDate:
            "${textEditControllerExpirationMonth.text}${textEditControllerExpirationYear.text}",
        cardCvv: textEditControllerSecurityCode.text,
        cardHolderName: textEditControllerCardHolderName.text);

    PagarMeFlutterCardHash pagarMeFlutterCardHash = new PagarMeFlutterCardHash(
        pagarMeApiKey: this.pagarmeApiKey, pagarMeCard: pagarMeCard);

    String cardHash = await pagarMeFlutterCardHash.generateCardHash();
    setState(() {
      isLoading = false;
      _cardHash = cardHash;
    });
  }

  Widget _newCardPage() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        TextFormField(
          controller: textEditControllerCardHolderName,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: "Card Holder Name"),
        ),
        TextFormField(
          controller: textEditControllerCardNumber,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Card Number"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: textEditControllerExpirationMonth,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Month", contentPadding: EdgeInsets.all(3)),
                  maxLength: 2,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: textEditControllerExpirationYear,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Year", contentPadding: EdgeInsets.all(3)),
                  maxLength: 2,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(1),
                child: TextFormField(
                  controller: textEditControllerSecurityCode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "CVV", contentPadding: EdgeInsets.all(3)),
                  maxLength: 3,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            shape: StadiumBorder(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Generate Card hash',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            color: Colors.white,
            onPressed: () {
              _generateCardHash();
            },
          ), // This trailing comma makes auto-formatting nicer for build methods.,
        )
      ],
    );
  }

  _showCardHash() {
    if (this._cardHash == "") {
      return Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Text(
          'You have not generated a card hash yet.',
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Text(
          "Your card hash: ${this._cardHash}",
        ),
      );
    }
  }

  Widget _loadingOrShowStuff() {
    if (isLoading) {
      return Center(
          heightFactor: 6.0,
          child: CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ));
    }

    return Column(
      // Column is also layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _showCardHash(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _newCardPage(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: _loadingOrShowStuff(),
        ),
      ),
    );
  }
}
