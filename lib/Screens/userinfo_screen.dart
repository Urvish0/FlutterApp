import 'package:flutter/material.dart';
import 'package:practice_app/main.dart';
import 'package:practice_app/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'phone_register.dart';

TextEditingController usrName = new TextEditingController();
TextEditingController usrGender = new TextEditingController();
TextEditingController usrAge = new TextEditingController();
TextEditingController usrWeight = new TextEditingController();
TextEditingController usrHeight = new TextEditingController();

double GBMRr = 0;
double BMRr = 0;
int weight = int.parse(usrWeight.text);
int height = int.parse(usrHeight.text);
int age = int.parse(usrAge.text);
String gender = usrGender.text.toUpperCase();
calories(weight, height, gender, age){
  // int BMR = 0;
  if(gender == "MALE"){
    GBMRr = ((13.397*weight)+(4.799*height)-(5.677*age)+(88.362)) as double;
    print(GBMRr);
  }
  if(gender == "FEMALE"){
    GBMRr = ((9.247*weight)+(3.098*height)-(4.330*age)+(447.593)) as double;
    print(GBMRr);
  }
}

loseCal(weight, height, gender, age){
  if(gender == "MALE"){
    BMRr = ((10*weight)+(6.25*height)-(5*age)+(5)) as double;
    print(BMRr);
  }
  if(gender == "FEMALE"){
    BMRr = ((10*weight)+(6.25*height)-(5*age)-(16)) as double;
    print(BMRr);
  }
}
class UserInfoScreen1 extends StatefulWidget{
  const UserInfoScreen1({super.key});

  @override
  State<UserInfoScreen1> createState() => _UserInfoScreen1();
}
class _UserInfoScreen1 extends State<UserInfoScreen1>{

  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 125),
                    child: Text(
                      "Enter Your Credentials",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,fontFamily:"Montserrat"),
                    ),
                  ),
                  SizedBox(height: 50,),
                  //Name
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: usrName,
                      cursorColor: Colors.purple,

                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Gender
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: usrGender,
                      cursorColor: Colors.purple,

                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        hintText: "Gender",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Age
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: usrAge,
                      cursorColor: Colors.purple,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        hintText: "Age",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Weight
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: usrWeight,
                      cursorColor: Colors.purple,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        hintText: "Weight in Kg",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //height
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: usrHeight,
                      cursorColor: Colors.purple,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                      decoration: InputDecoration(
                        hintText: "Height in cm",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 90,),
                  //next button
                  Container(
                    margin: EdgeInsets.only(left: 200),
                    child: SizedBox(
                      width: 100,
                      child: CustomButton(
                        text: "Next",
                        onPressed: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainpage()));
                          await users
                              .add({
                              'Age': usrAge.text,
                              'Gender': usrGender.text,
                              'Name': usrName.text,
                              'Phone': phoneController.text,
                            // 'Age': 20,
                            // 'Gender': 'Male',
                            // 'Name': 'Rohan',
                            // 'Phone': '9619690000',
                          }).then((value) => print("User added"));

                          calories(weight, height, gender, age);
                          loseCal(weight, height, gender, age);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class profileScreen extends StatefulWidget{
  final String Name, Gender, Age, Weight, Height;
  const profileScreen({Key? key, required this.Name,required this.Gender,required this.Age,required this.Weight,required this.Height,}) : super(key: key);
  @override
  State<profileScreen> createState() => _profileScreen();
}

class  _profileScreen extends State<profileScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 300, left: 200),
                child: Column(
                  children: [
                    Text(widget.Name),
                    Text(widget.Gender),
                    Text(widget.Age),
                    Text(widget.Weight),
                    Text(widget.Height),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}

