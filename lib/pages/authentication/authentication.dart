import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/classes/models/global_variable.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/layout.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _nome = TextEditingController(text: "");
    TextEditingController _password = TextEditingController(text: "");

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: surface(16),
          ),
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          color: getEmphasis(onBackground, emphasis.high),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel.",
                    color: getEmphasis(onSurface, emphasis.medium),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  textAlign: TextAlign.left,
                  controller: _nome,
                  style: TextStyle(
                      color: getEmphasis(
                    onSurface,
                    emphasis.high,
                  )),
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: primary),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: getEmphasis(onSurface, emphasis.medium),
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: primary, width: 2)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: primary),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: getEmphasis(onSurface, emphasis.medium),
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: primary, width: 2)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      CustomText(
                        text: "Remeber Me",
                        color: getEmphasis(onBackground, emphasis.high),
                      ),
                    ],
                  ),
                  CustomText(text: "Forgot password?", color: primary)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInkWell(
                radius: 20,
                style: ContainerStyle.primary,
                onTap: () async {
                  user = User.admin;
                  logined = true;

                  Get.offAll(() => SiteLayout());
                  var username = _nome.text;
                  var password = _password.text;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: getEmphasis(onPrimary, emphasis.high),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Do not have admin credentials? ",
                    style: TextStyle(
                        color: getEmphasis(onSurface, emphasis.medium))),
                TextSpan(
                    text: "Request Credentials! ",
                    style: TextStyle(color: primary))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
