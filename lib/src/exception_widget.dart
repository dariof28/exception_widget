import 'package:flutter/material.dart';

/// If [error] is a specific Exception and there is a Mapping for that Exception
/// returns that Widget otherwise return an empty Container.
class ExceptionWidget extends StatelessWidget {
  /// The exception to deal with
  final Exception error;

  /// A map of Exception type and the corresponding widget that should be returned
  final Map<Type, Widget> errorMap;

  ExceptionWidget({@required this.error, @required this.errorMap})
      : assert(error != null),
        assert(errorMap != null);

  @override
  Widget build(BuildContext context) => errorMap.containsKey(error.runtimeType)
      ? errorMap[error.runtimeType]
      : Container();
}
