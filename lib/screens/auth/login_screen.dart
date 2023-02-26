import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';
import 'package:tourism_app/screens/auth/admin_login.dart';
import 'package:tourism_app/screens/auth/signup_screen.dart';

import '../user/user_home.dart';

class UserLogin extends StatefulWidget {
  static const routeName = '/userLogin';
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: Image(
                  image: AssetImage('assets/images/tourism.gif'),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'مرحبا بك فى دليلك السياحى سجل دخول',
                          style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                          height: 65.h,
                          child: TextField(
                            style: TextStyle(color: Colors.amber),
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.amber,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.amber,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.amber),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'البريد الألكترونى',
                              hintStyle: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                          height: 65.h,
                          child: TextField(
                            style: TextStyle(color: Colors.amber),
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.amber,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.amber),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.amber),
                                ),
                                border: OutlineInputBorder(),
                                hintText: 'كلمة المرور',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                  fontFamily: 'Cairo',
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: 200.w, height: 50.h),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(25), // <-- Radius
                              ),
                            ),
                            child: Text(
                              'سجل دخول',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            onPressed: () async {
                              var email = emailController.text.trim();
                              var password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                CherryToast.info(
                                  title: Text('Please fill all fields'),
                                  actionHandler: () {},
                                ).show(context);
                                return;
                              }

                              ProgressDialog progressDialog = ProgressDialog(
                                  context,
                                  title: Text('Logging In'),
                                  message: Text('Please Wait'));
                              progressDialog.show();

                              try {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                UserCredential userCredential =
                                    await auth.signInWithEmailAndPassword(
                                        email: email, password: password);

                                if (userCredential.user != null) {
                                  progressDialog.dismiss();
                                  Navigator.pushNamed(
                                      context, UserHome.routeName);
                                }
                              } on FirebaseAuthException catch (e) {
                                progressDialog.dismiss();
                                if (e.code == 'user-not-found') {
                                  CherryToast.info(
                                    title: Text('User not found'),
                                    actionHandler: () {},
                                  ).show(context);
                                } else if (e.code == 'wrong-password') {
                                  CherryToast.info(
                                    title: Text('Wrong email or password'),
                                    actionHandler: () {},
                                  ).show(context);
                                }
                              } catch (e) {
                                CherryToast.info(
                                  title: Text('Something went wrong'),
                                  actionHandler: () {},
                                ).show(context);
                                progressDialog.dismiss();
                              }
                            },
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AdminLogin.routeName);
                            },
                            child: Text(
                              'تسجيل الدخول كأدمن',
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignupPage.routeName);
                            },
                            child: Text(
                              'اضغط هنا لانشاء حساب',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
