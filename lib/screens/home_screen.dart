import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/news_screen.dart';
import 'package:news/shared/component/widget/drawer.dart';

import '../models/sources_model.dart';
import '../shared/component/const.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";
  bool search = false;
   String? searchText;

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<SourcesModel> futureGet;

  int? currentSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(
              child: CustomDrawer(
            onCategoryCliced: onCategoryCliced,
          )),
          appBar: AppBar(
            automaticallyImplyLeading: !widget.search,
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                      onTap: () {
                        if(selectedModel !=null){
                          widget.search = !widget.search;
                          setState(() {
                          });
                        }
                      },
                      child: widget.search ? const SizedBox() : const Icon(Icons.search)))
            ],
            backgroundColor: Const.PRIMARY_COLOR,
            title: widget.search
                ? Container(
                    height: 45,
                    width: 343,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              widget.search = !widget.search;
                              setState(() {
                                print(" widget.search = ${widget.search};");
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Const.PRIMARY_COLOR,
                              size: 30,
                            )),
                        Expanded(
                            child: TextFormField(
                          onChanged: (text) {
                            widget.searchText = text;
                            setState(() {

                            });
                          },
                          showCursor: false,
                          decoration: InputDecoration(
                              hintText: "Sesarch Article",
                              hintStyle: TextStyle(
                                  color: Colors.green.withOpacity(.4)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              )),
                        )),
                        const Icon(
                          Icons.search,
                          color: Const.PRIMARY_COLOR,
                          size: 30,
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                    "News App",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 21),
                  )),
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          body: selectedModel == null
              ? CategoryScreen(onCategoryClicked: onCategoryCliced)
              : NewsScreen(
                  categoryId: selectedModel!.id,
                  serch: widget.search,searchText: widget.searchText,
                )),
    );
  }

  CategoryModel? selectedModel;

  onCategoryCliced(categoryModel) {
    selectedModel = categoryModel;
    setState(() {});
  }
}
