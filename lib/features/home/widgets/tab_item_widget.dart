import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/core/colors_palette.dart';

import '../../../models/source_model.dart';

class TabItemWidget extends StatefulWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget(
      {super.key, required this.source, required this.isSelected});

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
          color: widget.isSelected ? ColorsPalette.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: ColorsPalette.primaryColor,
          )),
      child: Text(
        widget.source.name,
        style: TextStyle(
          fontFamily: "Exo",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: widget.isSelected ? Colors.white : ColorsPalette.primaryColor,
        ),
      ),
    );
  }
}
