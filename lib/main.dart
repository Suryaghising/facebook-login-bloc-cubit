import 'package:flutter/material.dart';

import 'routes/app_router.dart';

void main() => runApp(MyApp(router: AppRouter()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.router}) : super(key: key);

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
