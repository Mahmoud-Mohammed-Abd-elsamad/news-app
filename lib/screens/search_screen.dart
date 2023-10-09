import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/search_Screen_cubit/search_screen_cubit.dart';

import '../shared/component/widget/articles_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.searchText}) : super(key: key);

  final String searchText;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SearchScreenCubit>().getNewsBySearch(widget.searchText);
  }

  @override
  Widget build(BuildContext context) {
    context.read<SearchScreenCubit>().getNewsBySearch(widget.searchText);
    var cubit = context.read<SearchScreenCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:BlocBuilder<SearchScreenCubit,SearchScreenState>
        (builder: (BuildContext context, state) {
          if(state is SearchScreenShowLoading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is SearchScreenSuccess){
            return ListView.builder(
                        itemCount: cubit.listOfSearchData.length,
                        itemBuilder: (context, index) {
                          return ArticlesItem(
                            image: cubit.listOfSearchData[index].urlToImage ?? "",
                            auther: cubit.listOfSearchData[index].author ?? " ",
                            content: cubit.listOfSearchData[index].description ?? "",
                            date: cubit.listOfSearchData[index].publishedAt?.substring(0, 10) ??
                                "",
                          );
                        },
                      );
          }else{
            return const Center(child: Text('faild to load data'),);
          }
      },)
      // FutureBuilder(
      //   future: ApiManager.getNewsBySearch(
      //       searchText),
      //   builder: (context, snapshot) {
      //     var articles = snapshot.data?.articles ?? [];
      //     if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
      //     }
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: articles.length,
      //         itemBuilder: (context, index) {
      //           return ArticlesItem(
      //             image: articles[index].urlToImage ?? "",
      //             auther: articles[index].author ?? " ",
      //             content: articles[index].description ?? "",
      //             date: articles[index].publishedAt?.substring(0, 10) ??
      //                 "",
      //           );
      //         },
      //       );
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }
}
