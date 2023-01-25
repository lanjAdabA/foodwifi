import 'package:flutter/material.dart';
import 'package:foodwifi/model/restaurantspage.model.dart';

class floatingCard extends StatelessWidget {
  const floatingCard({
    Key? key,
    required this.alldata,
  }) : super(key: key);

  final RestaurantsPageModel? alldata;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 12,
          child:
              //todo {floating_card_contents}
              Container(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alldata!.title,
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      alldata!.description,
                      style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 119, 118, 118)),
                    ),
                  ),
                  Text(
                    alldata!.address,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 119, 118, 118)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 15, color: Colors.yellow[800]),
                        Text(
                          (alldata!.rating.toString()),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(221, 60, 60, 60)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '(${alldata!.ratingCount}+ ratings)',
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    const Color.fromARGB(255, 119, 118, 118)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.circle,
                            size: 2,
                          ),
                        ),
                        Text(
                          alldata!.time,
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 119, 118, 118)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.circle,
                            size: 2,
                          ),
                        ),
                        Text(
                          alldata!.distance,
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 119, 118, 118)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logofssai.png',
                            height: 30,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Lic. No.',
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 119, 118, 118)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 4),
                    child: Center(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              alldata!.notices[0],
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
