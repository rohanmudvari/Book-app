import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



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

      ),
    );
  }
}




