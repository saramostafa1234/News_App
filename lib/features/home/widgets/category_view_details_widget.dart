// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app_c11_mon/data/datasources/api_manager.dart';
// import 'package:news_app_c11_mon/features/home/viewmodel/articles_view_model.dart';
// import 'package:news_app_c11_mon/features/home/widgets/tab_item_widget.dart';
// import 'package:news_app_c11_mon/models/articles_model.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/colors_palette.dart';
// import '../../../models/source_model.dart';
// import '../articles_manager/cubit.dart';
// import 'article_item_widget.dart';
//
// class CategoryViewDetailsWidget extends StatefulWidget {
//   final List<Source> sourcesList;
//   const CategoryViewDetailsWidget({super.key, required this.sourcesList});
//
//   @override
//   State<CategoryViewDetailsWidget> createState() =>
//       _CategoryViewDetailsWidgetState();
// }
//
// class _CategoryViewDetailsWidgetState extends State<CategoryViewDetailsWidget> {
//   // late ArticleViewModel _articlesViewModel;
//   late ArticleCubit _articleCubit;
//   int selectedIndex = 0;
//   @override
//   void initState()
//   {
//     //_articlesViewModel = ArticleViewModel();
//     _articleCubit = ArticleCubit();
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DefaultTabController(
//           length: widget.sourcesList.length,
//           child: TabBar(
//               tabAlignment: TabAlignment.start,
//               indicatorPadding: EdgeInsets.zero,
//               labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               indicator: const BoxDecoration(),
//               dividerColor: Colors.transparent,
//               isScrollable: true,
//               onTap: (index) {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//                 _articleCubit.getNewsArticlesList(
//                     widget.sourcesList[selectedIndex].id
//                 );
//
//               },
//               tabs: widget.sourcesList
//                   .map(
//                     (source) => TabItemWidget(
//                       isSelected:
//                           selectedIndex == widget.sourcesList.indexOf(source),
//                       source: source,
//                     ),
//                   )
//                   .toList()),
//         ),
//         BlocProvider(create: (context)=>_articleCubit..getNewsArticlesList(widget.sourcesList[selectedIndex].id),
//           child: BlocConsumer( listener: (context,state){},builder: (context,state){
//             var cubit = ArticleCubit.get(context);
//             if(cubit.articlesList.isEmpty)
//               {
//                 return  Center(child: CircularProgressIndicator());
//               }
//             return Expanded(
//               child: ListView.builder(
//                   itemCount: cubit.articlesList.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ArticleDetailes(article: cubit.articlesList[index]),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 10, right: 10),
//                           child: Column(
//                             children: [
//                               // InkWell(onTap: () {
//                               //   Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //       builder: (context) =>
//                               //           ArticleDetailes(article: article),
//                               //     ),
//                               //   );
//                               // }),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: CachedNetworkImage(
//                                   imageUrl: cubit.articlesList[index].urlToImage,
//                                   placeholder: (context, url) => Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     width: double.infinity,
//                                     height: 200, // Adjust height as needed
//                                     child: const Center(
//                                       child: CircularProgressIndicator(
//                                         color: Color(0xff39A552),
//                                       ),
//                                     ),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                   const Icon(Icons.error),
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: 200, // Adjust height as needed
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 cubit.articlesList[index].author,
//                                 style: const TextStyle(
//                                     color: Color(0xff79828B), fontSize: 13),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               // InkWell(
//                               //   onTap: () {
//                               //     Navigator.push(
//                               //       context,
//                               //       MaterialPageRoute(
//                               //         builder: (context) =>
//                               //             ArticleDetailes(article: article),
//                               //       ),
//                               //     );
//                               //   },
//                               //   child:
//                               Text(
//                                 cubit.articlesList[index].title,
//                                 style: const TextStyle(
//                                     color: Color(0xff42505C),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               // ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               const Divider(
//                                 color: Color(0xff39A552),
//                                 thickness: 2,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                     // ListTile(
//                     // title: Text(articalesList[index].title),
//                     // subtitle: Text(articalesList[index].description),
//                     // leading: Image.network(articalesList[index].urlToImage),
//                     // ),
//                   }),
//             );
//           }),
//         ),
//
//         // ChangeNotifierProvider(
//         //   create: (context) => _articlesViewModel..getArticlesList(widget.sourcesList[selectedIndex].id),
//         //   child: Consumer<ArticleViewModel>(
//         //     builder: (context, vm, _) {
//         //       return Expanded(
//         //         child: ListView.builder(
//         //             itemCount: vm.articlesList.length,
//         //             itemBuilder: (context, index) {
//         //               final article = vm.articlesList[index];
//         //               return InkWell(
//         //                 onTap: () {
//         //                   Navigator.push(
//         //                     context,
//         //                     MaterialPageRoute(
//         //                       builder: (context) =>
//         //                           ArticleDetailes(article: article),
//         //                     ),
//         //                   );
//         //                 },
//         //                 child: Container(
//         //                   width: double.infinity,
//         //                   child: Padding(
//         //                     padding: const EdgeInsets.only(
//         //                         top: 10.0, left: 10, right: 10),
//         //                     child: Column(
//         //                       children: [
//         //                         // InkWell(onTap: () {
//         //                         //   Navigator.push(
//         //                         //     context,
//         //                         //     MaterialPageRoute(
//         //                         //       builder: (context) =>
//         //                         //           ArticleDetailes(article: article),
//         //                         //     ),
//         //                         //   );
//         //                         // }),
//         //                         ClipRRect(
//         //                           borderRadius: BorderRadius.circular(10.0),
//         //                           child: CachedNetworkImage(
//         //                             imageUrl: article.urlToImage,
//         //                             placeholder: (context, url) => Container(
//         //                               decoration: BoxDecoration(
//         //                                 color: Colors.white,
//         //                                 borderRadius: BorderRadius.circular(10.0),
//         //                               ),
//         //                               width: double.infinity,
//         //                               height: 200, // Adjust height as needed
//         //                               child: const Center(
//         //                                 child: CircularProgressIndicator(
//         //                                   color: Color(0xff39A552),
//         //                                 ),
//         //                               ),
//         //                             ),
//         //                             errorWidget: (context, url, error) =>
//         //                             const Icon(Icons.error),
//         //                             fit: BoxFit.cover,
//         //                             width: double.infinity,
//         //                             height: 200, // Adjust height as needed
//         //                           ),
//         //                         ),
//         //                         const SizedBox(
//         //                           height: 10,
//         //                         ),
//         //                         Text(
//         //                           article.author,
//         //                           style: const TextStyle(
//         //                               color: Color(0xff79828B), fontSize: 13),
//         //                         ),
//         //                         const SizedBox(
//         //                           height: 10,
//         //                         ),
//         //                         // InkWell(
//         //                         //   onTap: () {
//         //                         //     Navigator.push(
//         //                         //       context,
//         //                         //       MaterialPageRoute(
//         //                         //         builder: (context) =>
//         //                         //             ArticleDetailes(article: article),
//         //                         //       ),
//         //                         //     );
//         //                         //   },
//         //                         //   child:
//         //                         Text(
//         //                           article.title,
//         //                           style: const TextStyle(
//         //                               color: Color(0xff42505C),
//         //                               fontSize: 14,
//         //                               fontWeight: FontWeight.w700),
//         //                         ),
//         //                         // ),
//         //                         const SizedBox(
//         //                           height: 10,
//         //                         ),
//         //                         const Divider(
//         //                           color: Color(0xff39A552),
//         //                           thickness: 2,
//         //                         )
//         //                       ],
//         //                     ),
//         //                   ),
//         //                 ),
//         //               );
//         //               // ListTile(
//         //               // title: Text(articalesList[index].title),
//         //               // subtitle: Text(articalesList[index].description),
//         //               // leading: Image.network(articalesList[index].urlToImage),
//         //               // ),
//         //             }),
//         //       );
//         //       // return Expanded(
//         //       //   child: ListView.builder(
//         //       //     itemBuilder: (context, index) => ArticleDetailes(
//         //       //       article: vm.articlesList[index],
//         //       //     ),
//         //       //     itemCount: vm.articlesList.length,
//         //       //   ),
//         //       // );
//         //     },
//         //   ),
//         // ),
//         // FutureBuilder<List<Article>>(
//         //   future:
//         //       ApiManager.fetchArticalList(widget.sourcesList[selectedIndex].id),
//         //   builder: (context, snapShot) {
//         //     if (snapShot.hasError) {
//         //       return const Text("Error Fetching");
//         //     }
//         //     if (snapShot.connectionState == ConnectionState.waiting) {
//         //       return const Center(
//         //         child: CircularProgressIndicator(
//         //           color: Color(0xff39A552),
//         //         ),
//         //       );
//         //     }
//         //
//         //     List<Article> articalesList = snapShot.data ?? [];
//         //     return Expanded(
//         //       child: ListView.builder(
//         //           itemCount: articalesList.length,
//         //           itemBuilder: (context, index) {
//         //             final article = articalesList[index];
//         //             return InkWell(
//         //               onTap: () {
//         //                 Navigator.push(
//         //                   context,
//         //                   MaterialPageRoute(
//         //                     builder: (context) =>
//         //                         ArticleDetailes(article: article),
//         //                   ),
//         //                 );
//         //               },
//         //               child: Container(
//         //                 width: double.infinity,
//         //                 child: Padding(
//         //                   padding: const EdgeInsets.only(
//         //                       top: 10.0, left: 10, right: 10),
//         //                   child: Column(
//         //                     children: [
//         //                       // InkWell(onTap: () {
//         //                       //   Navigator.push(
//         //                       //     context,
//         //                       //     MaterialPageRoute(
//         //                       //       builder: (context) =>
//         //                       //           ArticleDetailes(article: article),
//         //                       //     ),
//         //                       //   );
//         //                       // }),
//         //                       ClipRRect(
//         //                         borderRadius: BorderRadius.circular(10.0),
//         //                         child: CachedNetworkImage(
//         //                           imageUrl: article.urlToImage,
//         //                           placeholder: (context, url) => Container(
//         //                             decoration: BoxDecoration(
//         //                               color: Colors.white,
//         //                               borderRadius: BorderRadius.circular(10.0),
//         //                             ),
//         //                             width: double.infinity,
//         //                             height: 200, // Adjust height as needed
//         //                             child: const Center(
//         //                               child: CircularProgressIndicator(
//         //                                 color: Color(0xff39A552),
//         //                               ),
//         //                             ),
//         //                           ),
//         //                           errorWidget: (context, url, error) =>
//         //                               const Icon(Icons.error),
//         //                           fit: BoxFit.cover,
//         //                           width: double.infinity,
//         //                           height: 200, // Adjust height as needed
//         //                         ),
//         //                       ),
//         //                       const SizedBox(
//         //                         height: 10,
//         //                       ),
//         //                       Text(
//         //                         article.author,
//         //                         style: const TextStyle(
//         //                             color: Color(0xff79828B), fontSize: 13),
//         //                       ),
//         //                       const SizedBox(
//         //                         height: 10,
//         //                       ),
//         //                       // InkWell(
//         //                       //   onTap: () {
//         //                       //     Navigator.push(
//         //                       //       context,
//         //                       //       MaterialPageRoute(
//         //                       //         builder: (context) =>
//         //                       //             ArticleDetailes(article: article),
//         //                       //       ),
//         //                       //     );
//         //                       //   },
//         //                       //   child:
//         //                       Text(
//         //                         article.title,
//         //                         style: const TextStyle(
//         //                             color: Color(0xff42505C),
//         //                             fontSize: 14,
//         //                             fontWeight: FontWeight.w700),
//         //                       ),
//         //                       // ),
//         //                       const SizedBox(
//         //                         height: 10,
//         //                       ),
//         //                       const Divider(
//         //                         color: Color(0xff39A552),
//         //                         thickness: 2,
//         //                       )
//         //                     ],
//         //                   ),
//         //                 ),
//         //               ),
//         //             );
//         //             // ListTile(
//         //             // title: Text(articalesList[index].title),
//         //             // subtitle: Text(articalesList[index].description),
//         //             // leading: Image.network(articalesList[index].urlToImage),
//         //             // ),
//         //           }),
//         //     );
//         //   },
//           // FutureBuilder <List<Article>>(
//           //     future: ApiManager.fetchArticalList(
//           //         widget.sourcesList[selectedIndex].id),
//           //     builder: (context, snapshot) {
//           //       if (snapshot.hasError) {
//           //         return const Text(
//           //           "Error fetching",
//           //         );
//           //       }
//           //       if (snapshot.connectionState == ConnectionState.waiting) {
//           //         return const Center(
//           //           child: CircularProgressIndicator(
//           //             color: ColorsPalette.primaryColor,
//           //           ),
//           //         );
//           //       }
//           //       List<Article>articlesList = snapshot.data??[];
//           //       return Expanded(
//           //         child: ListView.builder(itemBuilder: (context,index)=> ListTile(
//           //           title: Text(articlesList[index].title),
//           //
//           //         ),
//           //           itemCount: articlesList.length,
//           //         ),
//           //       );
//           //
//           //
//           //     }),
//
//       ],
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_mon/features/home/articles_manager/cubit.dart';
import 'package:news_app_c11_mon/features/home/articles_manager/state.dart';
import 'package:news_app_c11_mon/features/home/widgets/tab_item_widget.dart';

import '../../../models/source_model.dart';
import 'article_item_widget.dart';

class CategoryViewDetails extends StatefulWidget {
  final List<Source> sourcesList;

  const CategoryViewDetails({super.key, required this.sourcesList});

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  // late ArticlesViewModel _articlesViewModel;
  late ArticleCubit _articlesCubit;
  int selectedIndex = 0;

  @override
  void initState() {
    // _articlesViewModel = ArticlesViewModel();
    _articlesCubit = ArticleCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(vertical: 10),
                indicator: const BoxDecoration(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });

                  _articlesCubit.getNewsArticlesList(
                      widget.sourcesList[selectedIndex].id);
                },
                tabs: widget.sourcesList
                    .map((source) => TabItemWidget(
                          source: source,
                          isSelected: selectedIndex ==
                              widget.sourcesList.indexOf(source),
                        ))
                    .toList())),
        BlocProvider(
          create: (context) => _articlesCubit
            ..getNewsArticlesList(widget.sourcesList[selectedIndex].id),
          child: BlocConsumer<ArticleCubit, ArticlesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ArticleCubit.get(context);
              if (cubit.articlesList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: cubit.articlesList.length,
                    itemBuilder: (context, index) {
                      // final article = cubit.articlesList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailes(
                                  article: cubit.articlesList[index]),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        cubit.articlesList[index].urlToImage,
                                    placeholder: (context, url) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      width: double.infinity,
                                      height: 200,
                                      // Adjust height as needed
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff39A552),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200, // Adjust height as needed
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  cubit.articlesList[index].author,
                                  style: const TextStyle(
                                      color: Color(0xff79828B), fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) =>
                                //             ArticleDetailes(article: article),
                                //       ),
                                //     );
                                //   },
                                //   child:
                                Text(
                                  cubit.articlesList[index].title,
                                  style: const TextStyle(
                                      color: Color(0xff42505C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                // ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Color(0xff39A552),
                                  thickness: 2,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      // ListTile(
                      // title: Text(articalesList[index].title),
                      // subtitle: Text(articalesList[index].description),
                      // leading: Image.network(articalesList[index].urlToImage),
                      // ),
                    }),
              );
            },
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => _articlesViewModel
        //     ..getArticlesList(widget.sourcesList[selectedIndex].id),
        //   child: Consumer<ArticlesViewModel>(builder: (context, vm, _) {
        //     if (vm.articlesList.isEmpty) {
        //       return const Center(child: Text("Loading Data..."));
        //     }
        //     return Expanded(
        //       child: ListView.builder(
        //           itemCount: vm.articlesList.length,
        //           itemBuilder: (context, index) {
        //             final article = vm.articlesList[index];
        //             return InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) =>
        //                         ArticleDetailes(article: article),
        //                   ),
        //                 );
        //               },
        //               child: SizedBox(
        //                 width: double.infinity,
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 10.0, left: 10, right: 10),
        //                   child: Column(
        //                     children: [
        //                       ClipRRect(
        //                         borderRadius: BorderRadius.circular(10.0),
        //                         child: CachedNetworkImage(
        //                           imageUrl: article.urlToImage,
        //                           placeholder: (context, url) => Container(
        //                             decoration: BoxDecoration(
        //                               color: Colors.white,
        //                               borderRadius: BorderRadius.circular(10.0),
        //                             ),
        //                             width: double.infinity,
        //                             height: 200, // Adjust height as needed
        //                             child: const Center(
        //                               child: CircularProgressIndicator(
        //                                 color: Color(0xff39A552),
        //                               ),
        //                             ),
        //                           ),
        //                           errorWidget: (context, url, error) =>
        //                               const Icon(Icons.error),
        //                           fit: BoxFit.cover,
        //                           width: double.infinity,
        //                           height: 200, // Adjust height as needed
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       Text(
        //                         article.author,
        //                         style: const TextStyle(
        //                             color: Color(0xff79828B), fontSize: 13),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       // InkWell(
        //                       //   onTap: () {
        //                       //     Navigator.push(
        //                       //       context,
        //                       //       MaterialPageRoute(
        //                       //         builder: (context) =>
        //                       //             ArticleDetailes(article: article),
        //                       //       ),
        //                       //     );
        //                       //   },
        //                       //   child:
        //                       Text(
        //                         article.title,
        //                         style: const TextStyle(
        //                             color: Color(0xff42505C),
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w700),
        //                       ),
        //                       // ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       const Divider(
        //                         color: Color(0xff39A552),
        //                         thickness: 2,
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //             // ListTile(
        //             // title: Text(articalesList[index].title),
        //             // subtitle: Text(articalesList[index].description),
        //             // leading: Image.network(articalesList[index].urlToImage),
        //             // ),
        //           }),
        //     );
        //   }),
        // ),
        // FutureBuilder<List<Artical>>(
        //   future:
        //       ApiManager.fetchArticalList(widget.sourcesList[selectedIndex].id),
        //   builder: (context, snapShot) {
        //     if (snapShot.hasError) {
        //       return const Text("Error Fetching");
        //     }
        //     if (snapShot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: Color(0xff39A552),
        //         ),
        //       );
        //     }

        //     List<Artical> articalesList = snapShot.data ?? [];
        //     return Expanded(
        //       child: ListView.builder(
        //           itemCount: articalesList.length,
        //           itemBuilder: (context, index) {
        //             final article = articalesList[index];
        //             return InkWell(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) =>
        //                         ArticleDetailes(article: article),
        //                   ),
        //                 );
        //               },
        //               child: Container(
        //                 width: double.infinity,
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 10.0, left: 10, right: 10),
        //                   child: Column(
        //                     children: [
        //                       // InkWell(onTap: () {
        //                       //   Navigator.push(
        //                       //     context,
        //                       //     MaterialPageRoute(
        //                       //       builder: (context) =>
        //                       //           ArticleDetailes(article: article),
        //                       //     ),
        //                       //   );
        //                       // }),
        //                       ClipRRect(
        //                         borderRadius: BorderRadius.circular(10.0),
        //                         child: CachedNetworkImage(
        //                           imageUrl: article.urlToImage,
        //                           placeholder: (context, url) => Container(
        //                             decoration: BoxDecoration(
        //                               color: Colors.white,
        //                               borderRadius: BorderRadius.circular(10.0),
        //                             ),
        //                             width: double.infinity,
        //                             height: 200, // Adjust height as needed
        //                             child: const Center(
        //                               child: CircularProgressIndicator(
        //                                 color: Color(0xff39A552),
        //                               ),
        //                             ),
        //                           ),
        //                           errorWidget: (context, url, error) =>
        //                               const Icon(Icons.error),
        //                           fit: BoxFit.cover,
        //                           width: double.infinity,
        //                           height: 200, // Adjust height as needed
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       Text(
        //                         article.author,
        //                         style: const TextStyle(
        //                             color: Color(0xff79828B), fontSize: 13),
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       // InkWell(
        //                       //   onTap: () {
        //                       //     Navigator.push(
        //                       //       context,
        //                       //       MaterialPageRoute(
        //                       //         builder: (context) =>
        //                       //             ArticleDetailes(article: article),
        //                       //       ),
        //                       //     );
        //                       //   },
        //                       //   child:
        //                       Text(
        //                         article.title,
        //                         style: const TextStyle(
        //                             color: Color(0xff42505C),
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w700),
        //                       ),
        //                       // ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       const Divider(
        //                         color: Color(0xff39A552),
        //                         thickness: 2,
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //             // ListTile(
        //             // title: Text(articalesList[index].title),
        //             // subtitle: Text(articalesList[index].description),
        //             // leading: Image.network(articalesList[index].urlToImage),
        //             // ),
        //           }),
        //     );
        //   },
        // )
      ],
    );
  }
}
