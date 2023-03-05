import 'package:flutter/material.dart';
import '../models/food_cal.dart';
import 'userinfo_screen.dart';

int usrBMR = GBMRr.round();

TextEditingController searched = new TextEditingController();

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  static List<foodModel> foodCals = [
    foodModel("Boiled Egg", 210),
    foodModel("Brown Bread", 148),
    foodModel("Banana Ripe", 177),
    foodModel("Cow's Milk", 167),
    foodModel("Apple", 131),
    foodModel("Orange", 62),
    foodModel("Marie Gold", 89),
    foodModel("Guava", 32),
    foodModel("Mango", 41),
    foodModel("Paneer", 257),
    foodModel("Tofu", 76),
    foodModel("Salmon", 172),
  ];

  List<foodModel> display_list = List.from(foodCals);

  void updateList(String value) {
    // for filtering the list
    setState(() {
      display_list = foodCals.where((element) => element.food!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
            child: Container(
              width: 340,
              height: 660,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Center(
                      child: Text(
                        'You have to consume $usrBMR calories to lose weight',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 320,
                    child: TextFormField(
                      onChanged: (value) => updateList(value),
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,

                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white

                      ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),

                        ),
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        ),
                      ),
                  ),
                  Container(
                    child: Expanded(
                        child: ListView.builder(
                          itemCount: display_list.length,
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                display_list[index].food!,
                                style: TextStyle(
                                  fontSize: 22,
                                    color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Text(
                                  "${display_list[index].cal!} Cals",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
