import 'package:exception_widget/exception_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyException implements Exception {}

class FooException implements Exception {}

class BarException implements Exception {}

void main() {
  testWidgets(
      'Specified widget should be rendered if map contains current exception',
      (WidgetTester tester) async {
    var exception = MyException();

    final widget = ExceptionWidget(
      error: exception,
      errorMap: {
        MyException: Text('MyException handled'),
        FooException: Text('CustomException handled'),
        BarException: Text('BarException handled'),
      },
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: widget),
    ));

    WidgetPredicate predicateMyException = (Widget widget) =>
        widget is Text && widget.data == 'MyException handled';

    WidgetPredicate predicateFooException = (Widget widget) =>
        widget is Text && widget.data == 'FooException handled';

    WidgetPredicate predicateBarException = (Widget widget) =>
        widget is Text && widget.data == 'BarException handled';

    expect(find.byWidgetPredicate(predicateMyException), findsOneWidget);
    expect(find.byWidgetPredicate(predicateFooException), findsNothing);
    expect(find.byWidgetPredicate(predicateBarException), findsNothing);
  });

  testWidgets(
      'Container should be rendered if map does not contains current exception',
      (WidgetTester tester) async {
    var exception = MyException();

    final widget = ExceptionWidget(
      error: exception,
      errorMap: {
        FooException: Text('CustomException handled'),
        BarException: Text('BarException handled'),
      },
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: widget),
    ));

    WidgetPredicate predicateFooException = (Widget widget) =>
        widget is Text && widget.data == 'FooException handled';

    WidgetPredicate predicateBarException = (Widget widget) =>
        widget is Text && widget.data == 'BarException handled';

    expect(find.byType(Container), findsOneWidget);
    expect(find.byWidgetPredicate(predicateFooException), findsNothing);
    expect(find.byWidgetPredicate(predicateBarException), findsNothing);
  });
}
