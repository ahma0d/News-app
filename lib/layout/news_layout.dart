import 'package:api_progect/cubit/cubit.dart';
import 'package:api_progect/cubit/states.dart';
import 'package:api_progect/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppCubit.get(context)
                  .screenTitle[AppCubit.get(context).currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                    )),
                IconButton(
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed: () {
                  setState(() {
                    AppCubit.get(context).changeAppMode();
                  });
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: AppCubit.get(context).bottomItems,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeBottomNav(index);
              },
            ),
            body: AppCubit.get(context)
                .screen[AppCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
