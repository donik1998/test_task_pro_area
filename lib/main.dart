import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_bloc.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_event.dart';
import 'package:new_test_stuff/presentation/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: BlocProvider(
        create: (context) => HomePageBloc()
          ..add(HomePageLoadPhotos(
            limit: 10,
            page: 1,
          )),
        child: const MyHomePage(),
      ),
    );
  }
}
