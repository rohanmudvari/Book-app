
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpods/constant/app_colors.dart';
import 'package:riverpods/constant/app_sizes.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height -kToolbarHeight-MediaQuery.of(context).padding.top;
    return Scaffold(

        backgroundColor: AppColors.appWhiteColor,
        appBar: AppBar(
          title: Text('Hi Everyone'),
          actions: [
            Icon(Icons.search),
            AppSizes.gapW4,
            Icon(CupertinoIcons.bell),
            SizedBox(width: 10,),
          ],
        ),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 270,
                    width: double.infinity,
                    child:  CachedNetworkImage(
                      placeholder: (c,s){
                        return Center(child: CircularProgressIndicator());
                      },
                      errorWidget: (c,s,d){

                        return Center(child: Text('something went wrong'));
                      },
                      imageUrl: 'https://scontent.fbwa1-1.fna.fbcdn.net/v/t39.30808-6/346985366_892623571831235_1005773920799686205_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=javl3cSjHhYAX-lV3xC&_nc_ht=scontent.fbwa1-1.fna&oh=00_AfBXoyzV_YDGy4e02ByOQhzKzoNOANE_L1Ar62B0FSRF2g&oe=6504DA1A',
                      fit: BoxFit.cover,
                    )),

                AppSizes.gapH10,
                Text('Hi i am rohan', style: TextStyle(fontFamily: 'Rubik', fontSize: 20, height: 2, wordSpacing: 20, letterSpacing: 2))
              ],
            )
        )

    );
  }
}