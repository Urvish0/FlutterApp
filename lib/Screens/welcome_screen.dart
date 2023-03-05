import 'package:flutter/material.dart';
import 'package:practice_app/Screens/register_screen.dart';
import 'package:practice_app/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Image.asset(
                  'assets/images/image1.png',
                  height: 300,
                ),
                const SizedBox(height: 20,),
                const Text(
                    "Let's get started !",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Never a better time than now to start !",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30,),
                //custom button
                SizedBox(
                  width: 300,
                  height: 50,
                  child: CustomButton(

                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> RegisterScreen(),
                        ),
                      );
                    } ,
                    text: "Get Started" ,
                  ),
                )

              ],
            ),
          ),
        ),
      )
    );
  }

}