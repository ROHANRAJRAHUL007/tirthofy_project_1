import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/forget_password.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/homepage.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/log_in.dart';
import 'package:tirthofy_code_1/features/service/widgets/global.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordsTextEditingController = TextEditingController();
  final confirmEditingController = TextEditingController();

  bool _passwordVisible = false;

  //declare a GlobalKey
  final _formKey = GlobalKey<FormState>();

  void _summit() async {
    //validate all the form fields
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailTextEditingController.text.trim(),
            password: passwordsTextEditingController.text.trim(),
          )
          .then((auth) async {
            currentUsser = auth.user;
            if (currentUsser != null) {
              Map userMap = {
                "id": currentUsser!.uid,
                "name": nameTextEditingController.text.trim(),
                "email": emailTextEditingController.text.trim(),
                "phone": phoneTextEditingController.text.trim(),
              };
              DatabaseReference userRef = FirebaseDatabase.instance.ref().child(
                "users",
              );
              userRef.child(currentUsser!.uid).set(userMap);
            }
            await Fluttertoast.showToast(msg: "suceesfully Registered");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => Homepage()),
            );
          })
          .catchError((errorMessage) {
            Fluttertoast.showToast(msg: "Error occured:\n $errorMessage");
          });
    } else {
      Fluttertoast.showToast(msg: "Not all feild are vaild ");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(8),
          //
          children: [
            Column(
              children: [
                Image.asset(
                  darkTheme
                      ? 'assets/images/registation_page/dark_reg.png'
                      : 'assets/images/registation_page/light_reg.png',
                ),
                SizedBox(height: 20),

                Text(
                  "Register",
                  style: TextStyle(
                    color: darkTheme ? Colors.amber : Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              decoration: InputDecoration(
                                //
                                hintText: "Name",
                                hintStyle:
                                    //
                                    TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber
                                      : Colors.blueAccent,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Name can not be empty';
                                }
                                if (text.length < 2) {
                                  return "Please enter a valid name";
                                }
                                if (text.length > 49) {
                                  return "Name can not be more than 50";
                                }
                              },
                              onChanged: (text) => setState(() {
                                nameTextEditingController.text = text;
                              }),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              decoration: InputDecoration(
                                //
                                hintText: "Email",
                                hintStyle:
                                    //
                                    TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber
                                      : Colors.blueAccent,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Email can not be empty';
                                }
                                if (EmailValidator.validate(text) == true) {
                                  return null;
                                }

                                if (text.length > 49) {
                                  return "Email can not be more than 50";
                                }
                              },
                              onChanged: (text) => setState(() {
                                emailTextEditingController.text = text;
                              }),
                            ),
                            SizedBox(height: 20),
                            IntlPhoneField(
                              showCountryFlag: false,
                              dropdownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: darkTheme ? Colors.black45 : Colors.grey,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              initialCountryCode: 'IND',
                              onChanged: (text) => setState(() {
                                phoneTextEditingController.text =
                                    text.completeNumber;
                              }),
                            ),
                            //  SizedBox(height: 10),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              decoration: InputDecoration(
                                //
                                hintText: "Password",
                                hintStyle:
                                    //
                                    TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: darkTheme
                                      ? Colors.amber
                                      : Colors.blueAccent,
                                ),

                                suffixIcon: IconButton(
                                  onPressed: () {
                                    //update the  state i.e toggle the state of password visible verialble
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : Colors.grey,
                                  ),
                                ),
                              ),

                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Name can not be empty';
                                }
                                if (text.length < 2) {
                                  return "Please enter a valid password";
                                }
                                // if (text.length > 7) {
                                //   return "Password long";
                                // }
                                return null;
                              },
                              onChanged: (text) => setState(() {
                                passwordsTextEditingController.text = text;
                              }),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              onPressed: _summit,
                              child: Text("Register"),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => ForgetPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  color: darkTheme ? Colors.amber : Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an account ?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (c) => LogIn()),
                                );
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: darkTheme ? Colors.amber : Colors.blue,
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
          ],
        ),
      ),
    );
  }
}
