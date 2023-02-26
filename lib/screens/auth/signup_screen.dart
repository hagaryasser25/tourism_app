import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signupPage';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nationalityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          body: Container(
            color: Colors.black,
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45.h,
                          ),
                          SizedBox(
                            height: 65.h,
                            child: TextField(
                              controller: nameController,
                              style: TextStyle(
                                color: Colors.amber
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.text_fields,
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
                                  hintText: 'الأسم',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                    fontFamily: 'Cairo',
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 65.h,
                            child: TextField(
                              
                              controller: phoneNumberController,
                              style: TextStyle(
                                color: Colors.amber
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
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
                                  hintText: 'رقم الهاتف',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                    fontFamily: 'Cairo',
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 65.h,
                            child: TextField(
                              controller: nationalityController,
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
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
                                  hintText: 'الجنسية',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                    fontFamily: 'Cairo',
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 65.h,
                            child: TextField(
                              style: TextStyle(
                                color: Colors.amber
                              ),
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
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'البريد الألكترونى',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                    fontFamily: 'Cairo',
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 65.h,
                            child: TextField(
                              style: TextStyle(
                                color: Colors.amber,
                              ),
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
                                'انشاء حساب',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                
                                var name = nameController.text.trim();
                                var phoneNumber =
                                    phoneNumberController.text.trim();
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();
                                var nationality = nationalityController.text.trim();

                                if (name.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    phoneNumber.isEmpty ||
                                    nationality.isEmpty) {
                                  CherryToast.info(
                                    title: Text('Please Fill all Fields'),
                                    actionHandler: () {},
                                  ).show(context);
                                  return;
                                }

                                if (password.length < 6) {
                                  // show error toast
                                  CherryToast.info(
                                    title: Text('Weak Password, at least 6 characters are required'),
                                    actionHandler: () {},
                                  ).show(context);

                                  return;
                                }

                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    title: Text('Signing Up'),
                                    message: Text('Please Wait'));
                                progressDialog.show();

                                try {
                                  FirebaseAuth auth = FirebaseAuth.instance;

                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  User? user = userCredential.user;

                                  if (userCredential.user != null) {
                                    DatabaseReference userRef = FirebaseDatabase
                                        .instance
                                        .reference()
                                        .child('users');

                                    String uid = userCredential.user!.uid;
                                    int dt =
                                        DateTime.now().millisecondsSinceEpoch;

                                    await userRef.child(uid).set({
                                      'name': name,
                                      'email': email,
                                      'uid': uid,
                                      'dt': dt,
                                      'phoneNumber': phoneNumber,
                                      'nationality': nationality
                                    });

                                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                                  } else {
                                    CherryToast.info(
                                    title: Text('Failed'),
                                    actionHandler: () {},
                                  ).show(context);
                                  }
                                  progressDialog.dismiss();
                                } on FirebaseAuthException catch (e) {
                                  progressDialog.dismiss();
                                  if (e.code == 'email-already-in-use') {
                                    CherryToast.info(
                                    title: Text('Email is already exist'),
                                    actionHandler: () {},
                                  ).show(context);
                                  } else if (e.code == 'weak-password') {
                                    CherryToast.info(
                                    title: Text('Password is weak'),
                                    actionHandler: () {},
                                  ).show(context);
                                  }
                                } catch (e) {
                                  progressDialog.dismiss();
                                  CherryToast.info(
                                    title: Text('Something went wrong'),
                                    actionHandler: () {},
                                  ).show(context);
                                }
                                
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
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
