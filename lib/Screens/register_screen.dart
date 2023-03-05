import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:practice_app/Screens/email_register.dart';
import 'package:practice_app/Screens/phone_register.dart';
import 'package:practice_app/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade50
                  ),
                  child: Image.asset("assets/images/image2.png"),
                ),
                SizedBox(height: 20,),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Add your phone number. We'll send you a verification OTP",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: "Phone",
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneRegisterScreen()));
                          },
                        )
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
