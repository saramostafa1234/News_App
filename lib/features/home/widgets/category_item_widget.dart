import 'package:flutter/material.dart';

import '../../../models/category_data.dart';

class CategoryItemWidget extends StatefulWidget {
  final int index;
  final CategoryData categoryData;
  final void Function(CategoryData) onCategoryClicked;

  const CategoryItemWidget(
      {super.key,
      required this.index,
      required this.categoryData,
      required this.onCategoryClicked});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onCategoryClicked(widget.categoryData);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: widget.categoryData.categoryBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: widget.index % 2 != 0
                  ? Radius.circular(0)
                  : Radius.circular(25),
              bottomRight: widget.index % 2 != 0
                  ? Radius.circular(25)
                  : Radius.circular(0),
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            )),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(widget.categoryData.categoryIcon),
            ),
            Text(
              widget.categoryData.categoryName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: "Exo",
              ),
            )
          ],
        ),
      ),
    );
  }
}
