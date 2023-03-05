import 'package:flutter/material.dart';
import 'userinfo_screen.dart';
import 'phone_register.dart';

String phone = phoneController.text;
String name = usrName.text;


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);


  @override
  prof createState() => prof();
}


class prof extends State<profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20,),
              Container(
                // width: MediaQuery.of(context).size.width,
                height: 210,
                width: 345,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                        Expanded(
                          child: Stack(
                            children: [
                               Container(
                                 margin: EdgeInsets.only(top:95, left: 215),
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/images/water-glass.png',
                                      ),
                                    ),
                                  ),

                                Container(
                                  margin: EdgeInsets.only(top:140, left: 20),
                                  child: Text(
                                    '$name',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFFFFFFF ),
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                  Container(
                                    margin: EdgeInsets.only(top:175, left: 20),
                                    child: Text(
                                      '+91 $phone',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                child: Text(
                  'Account Settings',
                  style: TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Text(
                            'User Details',
                            style:
                            TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.9, 0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF95A1AC),
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            child: Text(
                              'Notifications',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.9, 0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF95A1AC),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.9, 0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF95A1AC),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    ]),
    );
  }


}
