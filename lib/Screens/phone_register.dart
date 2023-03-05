import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:practice_app/Screens/userinfo_screen.dart';
import 'package:practice_app/main.dart';
import 'package:practice_app/widgets/custom_button.dart';

final TextEditingController phoneController = TextEditingController();
TextEditingController otpController = TextEditingController();

class PhoneRegisterScreen extends StatefulWidget{
  const PhoneRegisterScreen({super.key});

  @override
  State<PhoneRegisterScreen> createState() => _PhoneRegisterScreenState();
}
class _PhoneRegisterScreenState extends State<PhoneRegisterScreen>{


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
                TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.purple,
                  controller: phoneController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                  onChanged: (value){
                    setState(() {
                      phoneController.text = value;
                    });
                  },

                  decoration: InputDecoration(
                    hintText: "Enter Phone number",
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
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(bottomSheetHeight: 425),
                              onSelect: (value){
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${selectedCountry.flagEmoji}  +${selectedCountry.phoneCode}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9 ? Container(
                      child: Icon(
                        Icons.done_rounded,
                        color: Colors.green,
                        size: 25,

                      ),
                    ) : null,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: "Login",
                          onPressed: () async {
                            FirebaseAuth auth = FirebaseAuth.instance;

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+91"+phoneController.text,
                              verificationCompleted: (PhoneAuthCredential credential) async {
                                await auth.signInWithCredential(credential);
                              },
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId, int? resendToken) async {

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Enter the 6 Digit OTP'),
                                        content: TextField(
                                          controller: otpController,
                                          decoration: InputDecoration(hintText: "Enter OTP"),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: Text('Submit'),
                                            onPressed: () async {

                                              String smsCode = otpController.text;

                                              // Create a PhoneAuthCredential with the code
                                              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

                                              // Sign the user in (or link) with the credential
                                              await auth.signInWithCredential(credential);

                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoScreen1()));
                                            },
                                          ),

                                        ],
                                      );
                                    });
                                // Update the UI - wait for the user to enter the SMS code

                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          },
                        )
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: "Sign-up",
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfoScreen1()));

                          },
                        )
                    ),
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
