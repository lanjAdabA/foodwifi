import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SLiverAppBar extends StatelessWidget {
  const SLiverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appbarheight = MediaQuery.of(context).size.height;
    double appbarweight = MediaQuery.of(context).size.width;

    return SliverLayoutBuilder(builder: (context, constraints) {
      var scrollvalue = constraints.scrollOffset;
      return SliverAppBar(
        toolbarHeight: appbarheight / 9.1,
        floating: true, pinned: true,
        backgroundColor: Colors.blueGrey[100],

        //!sliver_Appbar_leading

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
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    height: appbarheight / 25,
                    child: Center(
                      child:
                          //!_searchbar_using_textField
                          TextField(
                        decoration: InputDecoration(
//?  SEARCHBAR TEXT
                          hintText:
                              scrollvalue > 0 ? "What are you craving?" : '',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 241, 241, 241),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 241, 241, 241),
                            ),
                          ),
                          label: scrollvalue > 0
//?  SEARCHBAR TEXT
                              ? Text("What are you craving?")
                              : AnimatedTextKit(
                                  repeatForever: true,
                                  displayFullTextOnTap: true,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      speed: Duration(milliseconds: 150),
                                      'hyderabadi biryani',
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600]),
                                    ),
                                    TyperAnimatedText(
                                      speed: Duration(milliseconds: 150),
                                      'BBQ chicken wings',
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600]),
                                    ),
                                    TyperAnimatedText(
                                      speed: Duration(milliseconds: 150),
                                      'clear chicken soup',
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600]),
                                    ),
                                    TyperAnimatedText(
                                      speed: Duration(milliseconds: 150),
                                      'smoked pork ribs',
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600]),
                                    ),
                                  ],
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                ),
                        ),
                        showCursor: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: appbarheight * 0.01,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
