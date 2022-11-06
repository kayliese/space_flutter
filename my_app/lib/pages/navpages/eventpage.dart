import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        "Event Page",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
