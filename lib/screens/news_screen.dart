import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/home/home_cubit.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/shared/component/const.dart';
import '../shared/component/widget/articles_item_list_view.dart';
import '../shared/component/widget/tap_item.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key, required this.categoryId,required this.serch ,this.searchText});

  static String routeName = "NewsScreen";
  int curentSelectedTap = 0;
  String categoryId;
  bool serch;
  String? searchText;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // late Future<SourcesModel> futureGet;


  @override
  void initState() {
     /// HomeCubit().getSources(widget.categoryId);
    super.initState();
    HomeCubit cubit = BlocProvider.of(context);
    cubit.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return widget.serch ? SearchScreen(searchText: widget.searchText ?? "news") :
    BlocConsumer<HomeCubit,HomeState>(builder: (BuildContext context, state) {

          if(state is HomeGetSourcesFailure){
            return Center(child: Text(state.errorMessage));
          }else if(state is HomeSowLoading) {
            return const Center(child: CircularProgressIndicator(color: Const.PRIMARY_COLOR,),);
          }else{
          return Column(children: [
            DefaultTabController(
              length: cubit.sourcesList.length,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 40,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      widget.curentSelectedTap = value;
                      context.read<HomeCubit>().getNewsBySource(
                          context.read<HomeCubit>().sourcesList[widget.curentSelectedTap].id!);
                      // setState(() {
                      // });
                    },
                    tabs: cubit.sourcesList
                        .map((e) => TapItem(
                      text: e.name ?? "",
                      isSelected: e ==
                          cubit.sourcesList.elementAt(widget.curentSelectedTap),
                    ))
                        .toList(),
                  ),
                ),
              ),
            ),
                    ArticlesItemListView(curentSelectedTap: widget.curentSelectedTap,)


          ]);}

        },
          listener: (BuildContext context, Object? state) {  },);

  }
}
// BlocConsumer<HomeCubit,HomeState>(builder: (context, state) {
// cubit.getNewsBySource(cubit.sourcesList[widget.curentSelectedTap].id!);
// var articles = cubit.articalsList;
// if(state is HomeSowLoading){
// return const Center(child: CircularProgressIndicator());
// }else if(state is HomeFailureGetNewsBySource){
// return  Center(child: Text(state.errorMessgae),);
// }else{
// return   Expanded(
// child: ListView.builder(
// itemCount: articles.length,
// itemBuilder: (context, index) {
// return ArticlesItem(
// image: articles[index].urlToImage ?? "",
// auther: articles[index].author ?? " ",
// content: articles[index].description ?? "",
// date: articles[index].publishedAt?.substring(0, 10) ??
// "",
// );
// },
// ),
// );
// }
// }, listener: (context, state) {
//
// },)
