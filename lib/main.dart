import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var _layout=MainAxisAlignment.center;

  void _nextLayout() { 
    setState(() {
      _layout=_nextEnumLayout(_layout);
   }); 
  }

  MainAxisAlignment _nextEnumLayout(MainAxisAlignment value) {
    final nextIndex = (value.index + 1) % MainAxisAlignment.values.length; 
    return MainAxisAlignment.values[nextIndex];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
    void _incrementCounterX7() {
    setState(() {
      _counter = _counter + 7;
    });
  }

    void _clearCount() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: _layout,
          children: <Widget>[
            const Text(
              'El número misterioso es:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: SpeedDial( icon: Icons.star,
        backgroundColor: Colors.blue, 
        children: [
          SpeedDialChild(
            child: const Icon(Icons.plus_one,color: Colors.white), 
            label: 'Incrementar x1',
            backgroundColor: Colors.blueAccent,
            onTap: _incrementCounter,
          ),
          SpeedDialChild(
            child: const Text('+7',),
            label: 'Incrementar x7',
            backgroundColor: Color.fromARGB(255, 255, 183, 68),
            onTap: _incrementCounterX7,
          ),
          SpeedDialChild(
            child: const Icon(Icons.delete,color: Colors.white),
            label: 'Foja Cero',
            backgroundColor: Color.fromARGB(255, 255, 118, 68),
            onTap: _clearCount,
          ),
          SpeedDialChild(
            child: const Icon(Icons.layers_outlined,color: Colors.white), 
            label: 'Layout',
            backgroundColor: Colors.blueAccent,
            onTap: _nextLayout,
          ),
        ]
      ),
    );
  }
}
