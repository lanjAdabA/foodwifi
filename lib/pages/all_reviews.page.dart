import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/allReviews/cubit/all_reviews_cubit.dart';
import 'package:foodwifi/model/allreviews.model.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AllReviewsPage extends StatefulWidget {
  final String? id;

  const AllReviewsPage({
    super.key,
    required this.id,
  });

  @override
  State<AllReviewsPage> createState() => _AllReviewsPageState();
}

class _AllReviewsPageState extends State<AllReviewsPage> {
  ScrollController controller = ScrollController();
  int value = 1;
  int data = 10;

  AllReviewsModel? allreviewdata;
  @override
  void initState() {
    super.initState();
    log("text");

    context
        .read<AllReviewsCubit>()
        .getAllReviews(id: widget.id, page: "1", limit: data, ismoredata: true);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          data = data + 10;
        });
        context.read<AllReviewsCubit>().getAllReviews(
            id: widget.id, page: "1", limit: data, ismoredata: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final allreview = context.watch<AllReviewsCubit>().state;
    allreviewdata = allreview.allreviews;

    bool ismoreloading = allreview.position;

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
                size: 20,
              ),
            ),
          )),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: HideAccentBehaviour(),
          child: SingleChildScrollView(
            controller: controller,
            // physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 26,
                ),
                //! if null=> RatiingPageSkeleton(),
                allreviewdata == null
                    ? RatiingPageSkeleton()
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  allreviewdata!.rating.toString(),
                                  //!
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  allreviewdata!.ratingCount,
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 14),
                                ),
                                Text(
                                  " ratings & public reviews",
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            // height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: allreviewdata!.review.length,
                                  itemBuilder: (context, index2) {
                                    DateTime date = allreviewdata!
                                        .review[index2].createdDate;
                                    var formateddate =
                                        DateFormat("dd MMM, yyyy").format(date);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            allreviewdata!.review[index2].name!,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                allreviewdata!
                                                    .review[index2].rating!,
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 15),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow[800],
                                                size: 16,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3.0),
                                                child: Icon(
                                                  Icons.circle,
                                                  size: 2,
                                                ),
                                              ),
                                              Text(
                                                formateddate,
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 15),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                    fontSize: 15),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4),
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
                                          allreviewdata!.review[index2]
                                                      .description ==
                                                  null
                                              ? SizedBox()
                                              : Text(
                                                  allreviewdata!.review[index2]
                                                      .description
                                                      .toString(),
                                                  // maxLines: 2,
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      color: Colors.grey[800],
                                                      wordSpacing: 1,

                                                      // overflow: TextOverflow.ellipsis,
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      thickness: 1,
                                    );
                                  },
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                ismoreloading
                                    ? Center(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:
                                                  LoadingAnimationWidget.flickr(
                                                      leftDotColor:
                                                          Color.fromARGB(255,
                                                              243, 126, 118),
                                                      size: 20,
                                                      rightDotColor:
                                                          Color.fromARGB(255,
                                                              167, 138, 138)),
                                            ),
                                            Text("loading more data..")
                                          ],
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ],
                      )
              ],
            ),
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
          physics: NeverScrollableScrollPhysics(),
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

class HideAccentBehaviour extends ScrollBehavior {
  @override
  Widget buildViewPortChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  bool get shouldEnableGlow => false;
}
