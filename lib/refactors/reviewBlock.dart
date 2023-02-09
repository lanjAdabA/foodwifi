import 'package:foodwifi/model/review_modal_modified.model.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class reviewBlock extends StatefulWidget {
  final String id;
  final Reviewdata? reviewdata;
  const reviewBlock({
    Key? key,
    required this.id,
    required this.reviewdata,
  }) : super(key: key);

  @override
  State<reviewBlock> createState() => _reviewBlockState();
}

class _reviewBlockState extends State<reviewBlock> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        height: 210,
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What people say",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black87),
                ),
                //  reviewdata == null
                //     ? Center(child: CircularProgressIndicator())
                //     :
                InkWell(
                  onTap: () {
                    context.router.push(AllReviewsRoute(
                      id: widget.id,
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      radius: 12,
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.reviewdata!.rating.toString(),
                  //!
                  // "0.87",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[800],
                  size: 18,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  widget.reviewdata!.ratingCount!,
                  style: TextStyle(color: Colors.grey[800], fontSize: 14),
                ),
                Text(
                  " ratings & public reviews",
                  style: TextStyle(color: Colors.grey[800], fontSize: 13),
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            //todo {horizontal_scroll-@review}
            Container(
              //!
              height: 140,
              // width: double.maxFinite,
              color: Colors.transparent,
              child: ListView.builder(
                controller: PageController(viewportFraction: .89),
                physics: const PageScrollPhysics()
                    .applyTo(const BouncingScrollPhysics()),
                itemCount: widget.reviewdata!.review.length,
                // shrinkWrap: true,//! dont use shrinkwrap in horizontal scroll
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  DateTime date = widget.reviewdata!.review[index].createdDate;
                  var formateddate = DateFormat("dd MMM, yyyy").format(date);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child:
                        //todo {reviews}
                        Column(
                      children: [
                        Container(
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 211, 210, 210)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          //*--- padding done
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //*---name
                                  widget.reviewdata!.review[index].name == null
                                      ? SizedBox()
                                      : Text(
                                          widget
                                              .reviewdata!.review[index].name!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //*---rating
                                  Row(
                                    children: [
                                      Text(
                                        widget
                                            .reviewdata!.review[index].rating!,
                                        style: TextStyle(fontSize: 13),
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
                                        formateddate,
                                        // "${ reviewdata!.review[index].createdDate.year}/${ reviewdata!.review[index].createdDate.month}/${ reviewdata!.review[index].createdDate.day}",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 12),
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
                                            fontSize: 12),
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
                                  widget.reviewdata!.review[index]
                                              .description ==
                                          null
                                      ? SizedBox()
                                      : Text(
                                          widget.reviewdata!.review[index]
                                              .description
                                              .toString(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              height: 1.5,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
