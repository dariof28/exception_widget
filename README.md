# exception_widget

Flutter package that allows to deal with different widgets mapped by exception

## Features

### ExceptionWidget

This widget can be used in that situations where you need to handle multiple exception and return a specific view for each one (eg when dealing with a Future result).
You only have to pass the exception you need to deal with and a map of Type: Widget to define which widget to return when error is of that type.

If the current error is not mapped a `Container` will be returned.

```dart
ExceptionWidget(
  error: snapshot.error,
  errorMap: {
    FooException: Text('FooException handled'),
    BarException: Text('BarException handled'),
  },
)
```

This way you don't need to manually check the exception type to return the desired view
