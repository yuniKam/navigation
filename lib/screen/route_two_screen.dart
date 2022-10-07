import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Ppo'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 777);
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            // [HomeScreen() -> RouteOne() -> RouteTwo() -> RouteThree()]
            // [HomeScreen() <- RouteOne() <- RouteThree()]
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (_) => RouteThreeScreen(),
            //   ),
            // );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            // [HomeScreen() -> RouteOne() -> RouteTwo() -> RouteThree()]
            // [HomeScreen()]
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) => route.settings.name == '/',
            );
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(
            //     builder: (_) => RouteThreeScreen(),
            //   ),
            //   (route) => route.settings.name == '/',
            // );
          },
          child: Text('Push And Remove Until'),
        ),
      ],
    );
  }
}
