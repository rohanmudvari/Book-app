import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riverpods/view/home_page.dart';

// Future<String> getData() async{
//   await Future.delayed(Duration(seconds: 2));
//   throw Exception('someting went wrong');
//
// }

Future getData() async{
  final dio= Dio();

  try{
    final response = await dio.get('https://api.themoviedb.org/3/movie/popular',
         options: Options(
           headers: {
           'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2FkMmVlYTc1OTllYWRlNTQ1NzcyZGRiMjg2ZDM1MCIsInN1YiI6IjY0OWE0Nzk4MGU1YWJhMDBhY2YxZTAyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nF_0iS6h7-QaX2slD6Pswre6F7N4pPgKfRPGPROqGac'
          }
        ) );
 return response.data;
  }
  on DioException catch(err){
throw err.message.toString();
  }
}



void main () async{
  getData().then((value) => print(value)).catchError((err)=> print(err));
  // final data = getData();
  // print(data);
  // getData().then((value){
  //   print(value);
  // }).catchError((err){
  //   print('show err');
  // });
  // runApp(ProviderScope(child: Home()));

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
          darkTheme: ThemeData(

          ),

          theme: ThemeData.dark(
            useMaterial3: true,
            // fontFamily: 'Raleway',
            // colorSchemeSeed: Colors.brown,
            // appBarTheme: AppBarTheme(
            //   color: Colors.amber
            // )
          ).copyWith(

          ),
home:HomePage(),
      ),
    );
  }
}




