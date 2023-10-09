import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/home/home_cubit.dart';
import 'articles_item.dart';

class ArticlesItemListView extends StatefulWidget {
  const ArticlesItemListView({Key? key, required this.curentSelectedTap})
      : super(key: key);

  final int curentSelectedTap;

  @override
  State<ArticlesItemListView> createState() => _ArticlesItemListViewState();
}

class _ArticlesItemListViewState extends State<ArticlesItemListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<HomeCubit>().getNewsBySource(
        context.read<HomeCubit>().sourcesList[widget.curentSelectedTap].id!);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var articles = cubit.articalsList;
        if (state is HomeSowLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFailureGetNewsBySource) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return SizedBox(
            height: height * .83,
            child: Center(
              child: ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticlesItem(
                    image: articles[index].urlToImage ?? "",
                    auther: articles[index].author ?? " ",
                    content: articles[index].description ?? "",
                    date: articles[index].publishedAt?.substring(0, 10) ?? "",
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

