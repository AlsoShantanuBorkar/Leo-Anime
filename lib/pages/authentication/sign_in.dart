import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leo_anime/pages/authentication/sign_up.dart';
import 'package:leo_anime/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService authInstance = AuthService();

  String email = '';
  String password = '';
  final _formKey1 = GlobalKey<FormState>();

  TextStyle defaultStyle = GoogleFonts.roboto(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 20, 34, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: 600,
            width: double.infinity,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              color: const Color.fromRGBO(27, 30, 47, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: _formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          style: defaultStyle,
                          decoration: InputDecoration(
                              hintStyle: defaultStyle,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(17, 20, 34, 1),
                              hintText: "Email Address"),
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return "Enter valid Email Address";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          style: defaultStyle,
                          decoration: InputDecoration(
                              hintStyle: defaultStyle,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(17, 20, 34, 1),
                              hintText: "Password"),
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password length must be greater than 6";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          obscuringCharacter: '*',
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 125,
                          height: 50,
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(17, 20, 34, 1)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: (() async {
                              if (_formKey1.currentState!.validate()) {
                                try {
                                  await authInstance.signIn(email, password);
                                  return;
                                } catch (e) {
                                  return;
                                }
                              }
                            }),
                            //
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have a account? ",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 15,fontWeight: FontWeight.w400,letterSpacing: .5),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUpPage(),
                                      ),
                                    );
                                  },
                                text: "Sign Up",
                                style: GoogleFonts.roboto(
                                    color: const Color.fromRGBO(66, 64, 253, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "\n\nOr",
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: "\n\nSign In as a ",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 15,fontWeight: FontWeight.w400,letterSpacing: .5),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    try {
                                      await authInstance.signInAnonymously();
                                      return;
                                    } catch (e) {
                                      return;
                                    }
                                  },
                                text: "Guest User",
                                style: GoogleFonts.roboto(
                                    color: const Color.fromRGBO(66, 64, 253, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
