import 'package:flutter/material.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, USER NAME",
                              style: TextStyle(
                                  color: Colors.red[600],
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Welcome back!",
                              style: TextStyle(
                                  color: Colors.red[600], fontSize: 12),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red[600],
                              child: const Icon(
                                Icons.favorite,
                                size: 18,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //!sliverAppbar
              SliverAppBar(
                toolbarHeight: 110,
                floating: true, pinned: true,
                backgroundColor: Colors.blueGrey[100],

                //!sliverAppbarleading

                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "DELIVER TO",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "RW4X=9QR, Kyamgei,Nongpok Inkhol, Imphal, Manipur-795005, India",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            height: 46,
                            child: Center(
                              child: TextField(
                                // controller: searchBarController,
                                decoration: InputDecoration(
                                    icon: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    // prefixIcon: const Icon(
                                    //   Icons.search,
                                    // ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 241, 241, 241),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 241, 241, 241),
                                      ),
                                    ),
                                    hintText: '1111111'),
                                showCursor: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //!sliverItem

              SliverToBoxAdapter(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return ClipRRect(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Container(
                          height: 300,
                          color: Colors.white,

                          //!

                          //!
                        ),
                      ));
                    })),
              ),
            ],
          ),
        ));
  }
}
