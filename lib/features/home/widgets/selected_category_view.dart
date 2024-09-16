import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_mon/core/colors_palette.dart';
import 'package:news_app_c11_mon/data/datasources/api_manager.dart';

import 'package:news_app_c11_mon/features/home/viewmodel/source_view_model.dart';
import 'package:news_app_c11_mon/features/home/widgets/category_view_details_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/category_data.dart';
import '../../../models/source_model.dart';
import '../source_manager/cubit.dart';
import '../source_manager/states.dart';

class SelectedCategoryWidget extends StatelessWidget {
  final CategoryData categoryData;

  const SelectedCategoryWidget({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SourceCubit()..getNewsSourcesList(categoryData.categoryId),
      child: BlocConsumer<SourceCubit, SourcesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SourceCubit.get(context);
          if (cubit.sourcesList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return CategoryViewDetails(sourcesList: cubit.sourcesList);
        },
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) =>
    //       SourcesView()..getSourcesList(categoryData.categoryId),
    //   child: Consumer<SourcesView>(
    //     builder: (context, vm, _) {
    //       if (vm.sourcesList.isEmpty) {
    //         return const Center(
    //           child: Text(
    //             "Loading Data..",
    //           ),
    //         );
    //       }
    //       return CategoryViewDetailsWidget(sourcesList: vm.sourcesList);
    //     },
    //   ),
    // );
//     return FutureBuilder(
//         future: ApiManager.fetchSourcesList(categoryData.categoryId),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text(
//               "Error fetching",
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: ColorsPalette.primaryColor,
//               ),
//             );
//           }
//           List<Source> sourcesList = snapshot.data ?? [];
//           return CategoryViewDetailsWidget(sourcesList: sourcesList);
//         });
  }
}
