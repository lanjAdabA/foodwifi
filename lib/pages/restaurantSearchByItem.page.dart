import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RestaurantSearchByItemPage extends StatefulWidget {
  const RestaurantSearchByItemPage({super.key});

  @override
  State<RestaurantSearchByItemPage> createState() =>
      _RestaurantSearchByItemPageState();
}

class _RestaurantSearchByItemPageState
    extends State<RestaurantSearchByItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! wraped with material color to add elevation
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            //!horizontal list item

            //! vertical scroll section
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[50],
                    height: 300,
                    // child: Column(),
                  ),
                  Container(
                    color: Colors.black,
                    height: 300,
                    // child: Column(),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 300,
                    // child: Column(),
                  ),
                  Container(
                    color: Colors.pink,
                    height: 300,
                    // child: Column(),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 300,
                    // child: Column(),
                  ),
                  Container(
                    color: Colors.green,
                    height: 300,
                    // child: Column(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Material(
                  elevation: 5,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.grey[50],
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.grey[800],
                                size: 20,
                              ),
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                          ),
                          title: Text(
                            "Pizza",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          centerTitle: true,
                          elevation: 0,
                        ),
                        Container(
                          color: Colors.grey[50],
                          height: 44,
                          child: ListView.builder(
                            itemCount: 8,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 8),
                                  child: Chip(
                                    label: Text(
                                      "Sample data",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  )
                                  // Container(
                                  //   height: 10,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(12),
                                  //       color: Colors.grey[300]),
                                  //   child: Center(
                                  //     child: Padding(
                                  //       padding:
                                  //           const EdgeInsets.symmetric(horizontal: 12),
                                  //       child: Text(
                                  //         "Sample data",
                                  //         style: TextStyle(fontSize: 13),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
