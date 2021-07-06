import 'package:emoji_ui/foodstab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoji_ui/burgerpage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0),
                        )
                      ],
                      color: Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(
                            'assets/images/dragon.png',
                          ),
                          fit: BoxFit.contain)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "SEARCH FOR",
              style: GoogleFonts.notoSans(
                  fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "RECIPIES ",
              style: GoogleFonts.notoSans(
                  fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Recommanded ",
              style: GoogleFonts.notoSans(
                  fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Hamberger', 'assets/images/sandwitch.png',
                    '150', Colors.white, Colors.blueAccent),
                _buildListItem('Pastry', 'assets/images/pastry.png', '60',
                    Colors.white, Colors.greenAccent),
                _buildListItem('Cup Cake', 'assets/images/cupcake.png', '40',
                    Colors.white, Colors.lightBlueAccent),
                _buildListItem('BabyBel', 'assets/images/Babybel.png', '300',
                    Colors.white, Colors.blueGrey),
                _buildListItem('combo', 'assets/images/combo.png', '499',
                    Colors.white, Colors.purpleAccent),
                _buildListItem('Kuro Burger', 'assets/images/blackBurger.png',
                    '200', Colors.white, Colors.amberAccent),
                _buildListItem('milk', 'assets/images/milk.png', '100',
                    Colors.white, Colors.lightBlueAccent),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(child: Text("FEATURED")),
                Tab(child: Text("COMBO")),
                Tab(child: Text("FAVORITES")),
                Tab(child: Text("RECOMMENDED")),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  FoodTabs(),
                  FoodTabs(),
                  FoodTabs(),
                  FoodTabs(),
                ],
              )),
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgcolor,
      Color containerColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          //ToDo
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BergerPage(
                  heroTag: foodName,
                  foodName: foodName,
                  pricePerItem: price,
                  imgPath: imgPath)));
        },
        child: Container(
            height: 175.0,
            width: 150.0,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: foodName,
                  child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration:
                          BoxDecoration(color: bgcolor, shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(imgPath, height: 50, width: 50),
                      )),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  foodName,
                  style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                  ),
                ),
                Text(
                  '\रु.' + price,
                  style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
