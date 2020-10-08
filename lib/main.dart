import 'package:flutter/material.dart';
import 'itmes.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiY(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> list2 = [
    Item(13.0, Colors.blue),
    Item(33.0, Colors.blue),
    Item(5.0, Colors.blue),
    Item(56.0, Colors.blue),
    Item(20.0, Colors.blue),
    Item(65.0, Colors.blue),
    Item(16.0, Colors.blue),
    Item(70.0, Colors.blue),
    Item(60.0, Colors.blue),
    Item(25.0, Colors.blue),
    Item(30.0, Colors.blue),
    Item(40.0, Colors.blue),
    Item(35.0, Colors.blue),
    Item(85.0, Colors.blue),
    Item(80.0, Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              list2.shuffle();
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          child: Icon(Icons.face),
          onPressed: () async {
            List<double> _list = [];
            list2.forEach((element) {
              _list.add(element.value);
            });
            _list.sort();
            for (int i = 0; i < list2.length; i++) {
              var _val1 = _list[i];
              var _val2 = list2[i];
              for (int k = 0; k < list2.length; k++) {
                setState(() {
                  list2[k].color = Colors.redAccent;
                });

                if (_val1 == list2[k].value) {
                  setState(() {
                    list2[i] = Item(_val1, Colors.blue);
                    list2[k] = _val2;
                  });
                }

                await Future.delayed(Duration(milliseconds: 50));

                setState(() {
                  list2[k].color = Colors.blue;
                });
              }
            }
          },
        ),
      ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 550,
          alignment: Alignment.bottomLeft,
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: list2.map((e) {
              return Row(
                children: [
                  Container(
                    width: 10,
                    height: e.value * 6,
                    color: e.color,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      )),
    );
  }
}
