import 'package:api_progect/cubit/cubit.dart';
import 'package:api_progect/cubit/states.dart';
import 'package:api_progect/layout/news_layout.dart';
import 'package:api_progect/shared/network/local/cache_helper.dart';
import 'package:api_progect/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //هي بتضمنلي انو يشتغل
  DioHelper.init(); //..........
  await CacheHelper.init(); //...........
  final bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark ?? isDark!)); // قبل ما اعمل رن
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // primarySwatch: ,
              primarySwatch: Colors.deepOrange,
              //لون ال بريغراس
              scaffoldBackgroundColor: Colors.white,
              //لون ال شاشة
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  //  actionsIconTheme:IconThemeData(
                  //  color: Colors.black,
                  // ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    //هاد بيتحكم ب statusBar
                    statusBarColor: Colors.white, // color line
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    //لون العنوان
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              //ينطبق على الاتطبيق كلو
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                //لون النصوص
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // floatingActionButtonTheme:const FloatingActionButtonThemeData(
              //backgroundColor: Colors.deepOrange,
              // ),
            ),
            // هاد light
            darkTheme: ThemeData(
              //هاد dart
              primarySwatch: Colors.deepOrange,
              //لون ال بريغراس
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  //  actionsIconTheme:IconThemeData(
                  //  color: Colors.black,
                  // ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    //هاد بيتحكم ب statusBar
                    statusBarColor: HexColor('333739'), // color line
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: const TextStyle(
                    //لون العنوان
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              //ينطبق على الاتطبيق كلو
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                //لون النصوص
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            // بقلب بيناتهم
            home: const Directionality(
                // عربي  rtl
                textDirection: TextDirection.ltr,
                child: NewsLayout()),
          );
        },
      ),
    );
  }
}
