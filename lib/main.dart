import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/home/home_cubit.dart';
import 'package:news/repositories/data_sources/remote_data_sources.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/splash_screen.dart';

import 'cubits/search_Screen_cubit/search_screen_cubit.dart';
import 'my_observer.dart';


void main() {

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit(baseRepository:RemoteDataSource())),
        BlocProvider(create: (context)=>SearchScreenCubit(baseRepository: RemoteDataSource())),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName:(_)=>HomeScreen(),
        },
        home:  const SplashScreen(),
      ),
    );
  }
}