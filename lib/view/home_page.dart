
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpods/constant/app_colors.dart';
import 'package:riverpods/constant/app_sizes.dart';
import 'package:riverpods/dummy/book_data.dart';
import 'package:riverpods/view/detail_page.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height -kToolbarHeight-MediaQuery.of(context).padding.top;
    return Scaffold(

        backgroundColor: AppColors.appWhiteColor,
        appBar: AppBar(
          title: Text('Hi John'),
          actions: [
            Icon(Icons.search),
            AppSizes.gapW4,
            Icon(CupertinoIcons.bell),
            SizedBox(width: 10,),
          ],
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView(

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
                        imageUrl: 'https://images.unsplash.com/photo-1682686580849-3e7f67df4015?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=600&q=60',
                        fit: BoxFit.cover,
                      )),
                  AppSizes.gapH10,








                  Container(
                    height: 210,
                    child: ListView.separated(
                        separatorBuilder: (c, i){
                          return AppSizes.gapW12;
                          // return VerticalDivider(color: Colors.amber, width: 10,thickness: 20,);
                        },
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index){
                          final book = books[index];
                          return  InkWell(
                            onTap: (){
                              Get.to(() => DetailPage(book: book), transition:  Transition.leftToRight);
                            },
                            child: Container(
                              height: 210,
                              width: 300,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                          alignment: Alignment.topRight,
                                          height: 170,
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 115,
                                              ),
                                              AppSizes.gapW4,
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 20, top: 7, right: 5),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(book.title),
                                                      Text(book.detail, maxLines: 3,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(book.rating),
                                                          Text(book.genre)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        height:190,
                                        width: 100,
                                        book.imageUrl, fit: BoxFit.cover,),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          );


                        }
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('You may also like', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),),
                  ),


                  Container(
                    height: 200,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (context, index){
                          final book = books[index];
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    book.imageUrl,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(book.title),
                                    Text(book.genre, style: TextStyle(color: Colors.blueGrey),),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),


                ],
              ),
            )
        )

    );
  }
}
