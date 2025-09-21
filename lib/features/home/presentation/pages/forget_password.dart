import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:tirthofy_code_1/features/home/presentation/pages/homepage.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/log_in.dart';
import 'package:tirthofy_code_1/features/service/widgets/global.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

final emailTextEditingController = TextEditingController();

bool _passwordVisible = false;

//declare a GlobalKey
final _formKey = GlobalKey<FormState>();
void _submit() async {
  firebaseAuth
      .sendPasswordResetEmail(email: emailTextEditingController.text.trim())
      .then((value) {
        Fluttertoast.showToast(
          msg: "We have sent an email to recover password ,please check email",
        );
      })
      .onError((error, StackTrace) {
        Fluttertoast.showToast(msg: "Error occured:\n ${error.toString()}");
      });
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                  "Forget Password",
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

                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              onPressed: _submit,
                              child: Text("Confirm Email"),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (c) => LogIn()),
                                );
                              },
                              child: Text(
                                'Already have account ,log in !',
                                style: TextStyle(
                                  color: darkTheme ? Colors.amber : Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),

                            SizedBox(width: 5),
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
