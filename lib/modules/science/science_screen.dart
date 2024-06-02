import 'package:api_progect/cubit/cubit.dart';
import 'package:api_progect/cubit/states.dart';
import 'package:api_progect/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,NewsStates>(
      listener:(context,state){},
      builder:(context,state){
        return ConditionalBuilder(
          condition:AppCubit.get(context).science.isNotEmpty,
          builder:(context)=>ListView.separated(
            physics: const BouncingScrollPhysics(),// من شان اليست تنط
            itemBuilder:(context,index)=>buildArticleItem(AppCubit.get(context).science[index],context),
            separatorBuilder:(context,index)=> const SizedBox(
              height: 4.0,
            ),
            itemCount:AppCubit.get(context).science.length,
          ) ,
          fallback:(context)=>const Center(child:CircularProgressIndicator()) ,
        );
      } ,

    );
  }
}
