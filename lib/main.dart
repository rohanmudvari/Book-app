import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riverpods/providers/change_notifier.dart';
import 'package:riverpods/providers/state_notifier.dart';
import 'package:riverpods/view/todo_page.dart';



void main (){
 runApp(ProviderScope(child: Home()));

}




class Home extends StatelessWidget {

 @override
 Widget build(BuildContext context) {


  return ScreenUtilInit(
   designSize: const Size(375, 812),
   minTextAdapt: true,
   splitScreenMode: true,
   child: GetMaterialApp(
       debugShowCheckedModeBanner: false,

       theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Raleway',
        colorSchemeSeed: Colors.brown,
        // appBarTheme: AppBarTheme(
        //   color: Colors.amber
        // )
       ),
       home : TodoPage()
   ),
  );
 }
}




class CountState extends StatelessWidget {

 @override
 Widget build(BuildContext context) {

  return Scaffold(
      body: SafeArea(
       child: Consumer(
           builder: (context, ref, child) {

            final number = ref.watch(countState);

            return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text('$number', style: TextStyle(fontSize: 50),),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                TextButton(
                    onPressed: () {
                     ref.read(countState.notifier).state++;
                    }, child: Text('ADD')),
                TextButton(onPressed: () {}, child: Text('MINUS')),
               ],
              )
             ],
            );
           }
       ),
      )
  );
 }
}




class Counter extends StatelessWidget {



 @override
 Widget build(BuildContext context) {
  print('build');
  return Scaffold(
      body: SafeArea(
       child: Consumer(
           builder: (context, ref, child) {

            final number = ref.watch(countChange).number;
            return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text('$number', style: TextStyle(fontSize: 50),),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                TextButton(
                    onPressed: () {

                     ref.read(countChange).increment();


                    }, child: Text('ADD')),
                TextButton(onPressed: () {}, child: Text('MINUS')),
               ],
              )
             ],
            );
           }
       ),
      )
  );
 }
}





