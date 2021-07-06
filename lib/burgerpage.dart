import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BergerPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;
  BergerPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});
  @override
  _BergerPageState createState() => _BergerPageState();
}

class _BergerPageState extends State<BergerPage> {
  var netPrice = 0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  Stack(children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                        color: Colors.red.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text('1',
                              style: GoogleFonts.notoSans(
                                fontSize: 10.0,
                                textStyle: TextStyle(color: Colors.red),
                              )),
                        ),
                      ),
                    ),
                  ])
                ],
              )),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "SUPER",
              style: GoogleFonts.notoSans(
                  fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                  fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                  tag: widget.heroTag,
                  child: Container(
                      height: 200.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          widget.imgPath,
                        ),
                        fit: BoxFit.cover,
                      )))),
              SizedBox(width: 5.0),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              )
                            ]),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.favorite_border,
                          color: Color(0xFFFE7D6A),
                          size: 25.0,
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              )
                            ]),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.restore,
                          color: Color(0xFFFE7D6A),
                          size: 25.0,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 70.0,
                  width: 125.0,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                        '\रु.' +
                            (int.parse(widget.pricePerItem) * quantity)
                                .toString(),
                        style: GoogleFonts.notoSans(
                          fontSize: 40.0,
                          color: Color(0xFF5E6165),
                          fontWeight: FontWeight.w500,
                        )),
                  )),
              Container(
                  height: 60.0,
                  width: 225.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFFE7D6A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 40.0,
                          width: 115.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 17.0,
                                  icon: Icon(Icons.remove,
                                      color: Color(0xFFFE7D6A)),
                                  onPressed: () {
                                    adjustmentQuantity('MINUS');
                                  }),
                              Text(quantity.toString(),
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14.0,
                                    color: Color(0xFF5E6165),
                                    fontWeight: FontWeight.w400,
                                  )),
                              IconButton(
                                  iconSize: 17.0,
                                  icon:
                                      Icon(Icons.add, color: Color(0xFFFE7D6A)),
                                  onPressed: () {
                                    adjustmentQuantity('PLUS');
                                  })
                            ],
                          )),
                      Text('Add to Cart',
                          style: GoogleFonts.notoSans(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('FEATURED',
                style: GoogleFonts.notoSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Container(
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildListItem('1'),
                  _buildListItem('2'),
                  _buildListItem('3'),
                ],
              ))
        ],
      ),
    );
  }

  adjustmentQuantity(String pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(
          () {
            quantity += 1;
          },
        );
        return;
      case 'MINUS':
        setState(
          () {
            if (quantity != 0) {
              quantity -= 1;
            } else {
              quantity = 0;
            }
          },
        );
        return;
    }
  }

  _buildListItem(String columnNumber) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            //DO NOT DO THIS IN REAL APPLICATION
            if (columnNumber == '1')
              _buildColumnItem('assets/images/blackBurger.png',
                  'Delicious Burger', '150', Color(0xFFFBD6F5)),
            if (columnNumber == '1') SizedBox(height: 15.0),
            if (columnNumber == '1')
              _buildColumnItem('assets/images/cupcake.png', 'Testy CupCake',
                  '40', Color(0xFFFBD6F5)),
            if (columnNumber == '2')
              _buildColumnItem('assets/images/combo.png', '4*1 Combo', '450',
                  Colors.lightBlueAccent),
            if (columnNumber == '2') SizedBox(height: 15.0),
            if (columnNumber == '2')
              _buildColumnItem('assets/images/pastry.png', 'Testy Pastry', '40',
                  Colors.lightGreenAccent),

            if (columnNumber == '3')
              _buildColumnItem('assets/images/sandwitch.png',
                  'Delicious Burger', '150', Color(0xFFFBD6F5)),
            if (columnNumber == '3') SizedBox(height: 15.0),
            if (columnNumber == '3')
              _buildColumnItem('assets/images/milk.png', 'Pure Milk', '40',
                  Color(0xFFFBD6F5)),
          ],
        ));
  }

  _buildColumnItem(
      String imgPath, String foodName, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: bgColor,
                  ),
                  child: Center(
                      child: Image.asset(imgPath, height: 50.0, width: 50.0))),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: GoogleFonts.notoSans(
                        fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                  Text('\रु.' + price,
                      style: GoogleFonts.lato(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Colors.redAccent))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
