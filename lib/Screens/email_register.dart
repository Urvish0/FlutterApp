import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/controller/signup_controller.dart';
import 'package:practice_app/widgets/custom_button.dart';
import 'package:email_validator/email_validator.dart';

class EmailRegisterScreen extends StatefulWidget{
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}
class _EmailRegisterScreenState extends State<EmailRegisterScreen>{

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        icn = false;
        _errorMessage = "Email can not be empty";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        icn = false;
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {
          icn = true;
        _errorMessage = "";
      });
    }
  }
  String _errorMessage = '';
  bool icn = false;
  @override
  Widget build(BuildContext context) {

    // final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                  "Add your email address. We'll send you a verification OTP",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.purple,
                  onChanged: (val){
                    validateEmail(val);
                  },

                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),

                  decoration: InputDecoration(
                    hintText: "Enter email",
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
                    prefixIcon: Icon(
                      Icons.email_outlined
                    ),
                    suffixIcon: icn == true ? Container(
                        child: Icon(
                          Icons.done_rounded,
                          color: Colors.green,
                          size: 25,
                        ),
                    ): null,
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
                          onPressed: () {

                          },
                        )
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: "Sign-up",
                          onPressed: () {

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
