import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/core/colors_palette.dart';

class CustomDrawerWidget extends StatefulWidget {
  final void Function() onCategoryChangedClicked;

  const CustomDrawerWidget({super.key, required this.onCategoryChangedClicked});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: mediaQuery.size.height * 0.2,
            color: ColorsPalette.primaryColor,
            child: Text(
              "News App !",
              style: TextStyle(
                fontFamily: "Exo",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onCategoryChangedClicked;
            },
            child: const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: "Exo",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Settings ",
                    style: TextStyle(
                      fontFamily: "Exo",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
