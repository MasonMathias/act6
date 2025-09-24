import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Fuel text
          Center(
            child: Container(
              color: Colors.blue,
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
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
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Ignite
                    });
                  },
                  child: const Text("Ignite"),
                ),

                SizedBox(width: 30,),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Abort
                    });
                  },
                  child: const Text("Abort"),
                ),
                
                SizedBox(width: 30,),
                
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Reset
                    });
                  },
                  child: const Text("Reset"),
                ),
                
              ],
            ),

        ],
      ),
    );
  }
}
