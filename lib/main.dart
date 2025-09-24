import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;
  Color textColor = Colors.red;
  bool hitLiftoff = false;

  void _ignite() {
    setState(() {
      if (_counter < 100) {
        _counter += 1;
      }
    });
  }

  void _abort() {
    setState(() {
      if (_counter > 0) {
        _counter -= 1;
      }
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  void _updatePanelColor() {
    setState(() {
      if (_counter == 0) {
        textColor = Colors.red;
      } else if (_counter <= 50) {
        textColor = Colors.yellow;
      } else if (_counter <= 100) {
        textColor = Colors.lightGreen;
      }
    });
  }

  void _checkLiftoff() {
    setState(() {
      if (_counter == 100) {
        hitLiftoff = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Liftoff text
          hitLiftoff
              ? Text('LIFTOFF', style: TextStyle(fontSize: 80))
              : SizedBox(height: 80),
          SizedBox(height: 20),

          // Fuel text
          Center(
            child: Container(
              color: textColor,
              child: Text('$_counter', style: TextStyle(fontSize: 50.0)),
            ),
          ),

          // Fuel slider
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
                _updatePanelColor();
                _checkLiftoff();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: textColor,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _ignite();
                    _updatePanelColor();
                    _checkLiftoff();
                  });
                },
                child: const Text("Ignite"),
              ),

              SizedBox(width: 30),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _abort();
                    _updatePanelColor();
                  });
                },
                child: const Text("Abort"),
              ),

              SizedBox(width: 30),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _reset();
                    _updatePanelColor();
                  });
                },
                child: const Text("Reset"),
              ),
            ],
          ),

          SizedBox(height: 80),
        ],
      ),
    );
  }
}
