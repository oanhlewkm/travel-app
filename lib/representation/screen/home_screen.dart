import 'package:flutter/material.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'tada',
      implementLeading: true,
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
