import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/features/home/widgets/category_item_widget.dart';
import 'package:news_app_c11_mon/features/home/widgets/custome_drawr_widget.dart';
import 'package:news_app_c11_mon/features/home/widgets/selected_category_view.dart';

import '../../../models/category_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categoryDataList = [
    CategoryData(
      categoryId: "sports",
      categoryName: "sports",
      categoryIcon: "assets/icons/sports.png",
      categoryBackgroundColor: const Color(0xFFC91C22),
    ),
    CategoryData(
      categoryId: "general",
      categoryName: "Politics",
      categoryIcon: "assets/icons/Politics.png",
      categoryBackgroundColor: const Color(0xFF003E90),
    ),
    CategoryData(
      categoryId: "health",
      categoryName: "Health",
      categoryIcon: "assets/icons/health.png",
      categoryBackgroundColor: const Color(0xFFED1E79),
    ),
    CategoryData(
      categoryId: "business",
      categoryName: "Business",
      categoryIcon: "assets/icons/bussines.png",
      categoryBackgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryData(
      categoryId: "environment",
      categoryName: "environment",
      categoryIcon: "assets/icons/environment.png",
      categoryBackgroundColor: const Color(0xFF4882CF),
    ),
    CategoryData(
      categoryId: "science",
      categoryName: "Science",
      categoryIcon: "assets/icons/science.png",
      categoryBackgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern (1).png"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectCategoryData == null
                  ? "News App"
                  : selectCategoryData!.categoryName,
            ),
            actions: [
              if (selectCategoryData != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
          drawer: CustomDrawerWidget(
            onCategoryChangedClicked: onCategoryChangedClicked,
          ),
          body: selectCategoryData == null
              ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick your category \n of interest",
                        style: TextStyle(
                          fontFamily: "Exo",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4F5A69),
                          height: 1.2,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 15,
                            right: 15,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) => CategoryItemWidget(
                            index: index,
                            categoryData: categoryDataList[index],
                            onCategoryClicked: onCategoryClicked,
                          ),
                          itemCount: categoryDataList.length,
                        ),
                      ),
                    ],
                  ),
                )
              : SelectedCategoryWidget(
                  categoryData: selectCategoryData!,
                ),
        ));
  }

  CategoryData? selectCategoryData;

  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectCategoryData = categoryData;
    });
  }

  void onCategoryChangedClicked() {
    setState(() {
      selectCategoryData = null;
      Navigator.pop(context);
    });
  }
}
