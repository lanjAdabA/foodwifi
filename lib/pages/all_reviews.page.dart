import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/review.model.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/services/serviceApi.dart';

class AllReviewsPage extends StatefulWidget {
  final String id;

  const AllReviewsPage({super.key, required this.id});

  @override
  State<AllReviewsPage> createState() => _AllReviewsPageState();
}

class _AllReviewsPageState extends State<AllReviewsPage> {
  ReviewModel? reviewdata;

  @override
  void initState() {
    super.initState();
    getdata();
    log("text");
  }

  getdata() async {
    var reviewdata2 = await ServiceApi().getreviewdata(id: widget.id);

    setState(() {
      reviewdata = reviewdata2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          title: Text(
            "Ratings & Reviews",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800]),
          ),
          leading: InkWell(
            onTap: () {
              context.router.pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey[800],
              ),
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //       child: Icon(Icons.arrow_back_ios_new),
              //     ),
              //     Text(
              //       "Rating & Reviews",
              //       style:
              //           TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 26,
              ),
              //! if null=> RatiingPageSkeleton(),
              reviewdata == null
                  ? RatiingPageSkeleton()
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: reviewdata!.review.length,
                        itemBuilder: (context, index2) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reviewdata!.review[index2].name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      reviewdata!.review[index2].rating,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[800],
                                      size: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Icon(
                                        Icons.circle,
                                        size: 2,
                                      ),
                                    ),
                                    Text(
                                      reviewdata!.review[index2].createdDate
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Icon(
                                        Icons.circle,
                                        size: 2,
                                      ),
                                    ),
                                    Text(
                                      "Ordered on",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        height: 18,
                                        width: 18,
                                        child: Image.asset(
                                            "assets/images/foodwifilogo.png"))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                //*--- review
                                reviewdata!.review[index2].description == null
                                    ? SizedBox()
                                    : Text(
                                        reviewdata!.review[index2].description
                                            .toString(),
                                        // maxLines: 2,
                                        style: TextStyle(
                                            height: 1.5,
                                            // overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            thickness: 1,
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

//! rating skeleton
class RatiingPageSkeleton extends StatelessWidget {
  const RatiingPageSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Skeleton(
            height: 28,
            width: 200,
          ),
        ),
        ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Skeleton(
                height: 100,
              ),
            );
          },
        ),
      ],
    );
  }
}
