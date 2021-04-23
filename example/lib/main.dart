import 'package:exception_widget/exception_widget.dart';
import 'package:flutter/material.dart';

import 'exceptions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ExceptionWidget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter ExceptionWidget Demo'),
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
  Future _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _future = _foo();
                      });
                    },
                    child: Text('Foo'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _future = _bar();
                      });
                    },
                    child: Text('Bar'),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ExceptionWidget(
                    error: snapshot.error,
                    errorMap: {
                      FooException: Text('FooException handled'),
                      BarException: Text('BarException handled'),
                    },

                  );
                }

                return Text('Normal behavior');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _foo() async {
    return Future.error(FooException());
  }

  Future<void> _bar() async {
    return Future.error(BarException());
  }
}
