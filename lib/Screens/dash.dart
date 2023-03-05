
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'userinfo_screen.dart';
import 'package:practice_app/main.dart';
import 'userinfo_screen.dart';

// int usrLBMR = LBMR.round();
// int usrBMR = LBMR.round();

int USMR = BMRr.round();
String name = usrName.text;
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});


  @override
  State<Dashboard> createState() => dashState();

}

class dashState extends State<Dashboard>{

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, $name',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width:150,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(DateFormat("MM dd yyyy").format(DateTime.now()),
                    style:const TextStyle(
                        color: Colors.blueAccent,
                    fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            const Icon(Icons.fastfood,
            color: Colors.blueAccent,
            size:65)
          ],
          ),

            const SizedBox(
              height: 35,
            ),

            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12)
              ),
              child:Padding(
                padding: const EdgeInsets.only(top:60,left:50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:7),
                      child: Icon(Icons.local_fire_department_sharp,
                      size: 40,
                      color: Colors.red),
                    ),
                    SizedBox(width: 10),
                    Text('Burn $USMR calories \na day to Lose Weight',
                        style: TextStyle(
                        color:Colors.white,
                        fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                    ),
                  ],
                ),
              )
    ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('How do you feel?',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
                Icon(Icons.more_horiz,
                color: Colors.blueAccent,
                size: 40,)
              ],
            ),

                Row(
                children:[
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                          children:const[
                            SizedBox(
                              width: 20,
                            ),

                              Icon(Icons.emoji_emotions_outlined,
                              color: Colors.white,
                              size: 50,),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.emoji_emotions_outlined,
                              color: Colors.yellowAccent,
                              size: 50,),
                            SizedBox(
                              width: 20,
                            ),

                            Icon(Icons.emoji_emotions_outlined,
                              color: Colors.orangeAccent,
                              size: 50,),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.emoji_emotions_outlined,
                              color: Colors.lightGreenAccent,
                              size: 50,)
                          ]
                        ),
              ),
                    ),
                  ),

          ]

                ),
            SizedBox(
              height:25,
            ),

            Row(
              children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: _incrementCounter,
                        elevation: 2.0,
                        fillColor: Colors.lightBlueAccent,
                        child: Icon(
                          Icons.water_drop_outlined,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      )

                    ],
                  ),

                SizedBox(width: 10,),

                Text('Glasses of water\nconsumed : ',
                style: GoogleFonts.kanit(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),

                SizedBox(width:20),
                Text('$_counter',
                style: GoogleFonts.sourceCodePro(
                  fontSize: 45,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold
                ),)
              ],

            ),

            SizedBox(
              height: 15,
            ),

            Expanded(
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Remember to drink 10\nglasses of water everyday!!',
                    style: GoogleFonts.fredokaOne(
                      fontSize: 20,
                          color:Colors.white
                    ),)
                  ],
                ),
              ),
            )

      ]),
      ),
      )
    );
  }

}