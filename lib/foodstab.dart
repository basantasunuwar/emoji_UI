import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTabs extends StatefulWidget {
  @override
  _FoodTabsState createState() => _FoodTabsState();
}

class _FoodTabsState extends State<FoodTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem(
              'Delicious Burger', 4.4, '100', 'assets/images/blackBurger.png'),
          _buildListItem('Combo Pack', 4.0, '400', 'assets/images/combo.png'),
          _buildListItem(
              'Testy CupCake', 3.3, '400', 'assets/images/cupcake.png'),
          _buildListItem('Milk', 2.0, '400', 'assets/images/milk.png'),
          _buildListItem(
              'Delicious Sandwitch', 5.0, '400', 'assets/images/sandwitch.png'),
          _buildListItem(
              'Testy Pastry', 5.0, '400', 'assets/images/pastry.png'),
        ],
      ),
    );
  }

  _buildListItem(String foodName, double rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 300.0,
              child: Row(
                children: [
                  Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Color(0xFFFFE3DF)),
                    child: Center(
                      child: Image.asset(imgPath, height: 50.0, width: 50.0),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: GoogleFonts.notoSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {
                          debugPrint("Rating value is $v");
                        },
                        starCount: rating.toInt(),
                        rating: rating,
                        color: Color(0xFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 15.0,
                        spacing: 0.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '\रु.' + price,
                            style: GoogleFonts.lato(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                color: Color(0xFFF68D7F),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            '\रु.' + '150',
                            style: GoogleFonts.lato(
                              fontSize: 14.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: Center(
                child: Icon(Icons.add, color: Colors.white),
              ),
              backgroundColor: Color(0xFFFE7D6A))
        ],
      ),
    );
  }
}
