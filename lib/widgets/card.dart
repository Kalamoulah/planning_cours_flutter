import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  CardComponent({Key? key,
    required this.width,
    required this.height,
    this.color,
    this.customWidget
  }) : super(key: key);


  final double width;
  final double height;
  final Color? color;
  final Widget? customWidget;
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  String title = "Titre initial";
  String content = "Contenu initial";


  void updateCard() {
    setState(() {
      title = "Nouveau titre";
      content = "Nouveau contenu";
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.color ?? Colors.blue;
    return Container(
      height:  widget.height,
      width: widget.width ,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
          color: Colors.blue ,
          width: 1.0,
      ),
      ),
      child: widget.customWidget,
    );
  }
}
