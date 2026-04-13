part of "main.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qremo/main.dart';


class Card extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ThemedBox(height: 20,child: Column(mainAxisAlignment:MainAxisAlignment.start,children: [Container(color: Theme.of(context).brightness==Brightness.dark?lavenderDark:lavenderLight)],),);
    }
  
}
