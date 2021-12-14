import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_example1/classes/http/http_service.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/widgets/custom/custom_container.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';

class AutenticazionePagina extends StatefulWidget {
  const AutenticazionePagina({Key? key}) : super(key: key);

  @override
  State<AutenticazionePagina> createState() => _AutenticazionePaginaState();
}

class _AutenticazionePaginaState extends State<AutenticazionePagina> {
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
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
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
              //create a contai

              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                  valueListenable: loginFailed,
                  builder: (context, widget, value) {
                    return TextField(
                        textAlign: TextAlign.left,
                        controller: _nome,
                        style: TextStyle(
                            color: getEmphasis(
                          onSurface,
                          emphasis.high,
                        )),
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: loginFailed.value
                              ? TextStyle(color: error)
                              : TextStyle(color: primary),
                          enabledBorder: loginFailed.value
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      color:
                                          getEmphasis(error, emphasis.medium),
                                      width: 1))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      color: getEmphasis(
                                          onSurface, emphasis.medium),
                                      width: 1)),
                          focusedBorder: loginFailed.value
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      BorderSide(color: error, width: 2))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      BorderSide(color: primary, width: 2)),
                          border: OutlineInputBorder(
                              borderSide: loginFailed.value
                                  ? BorderSide(color: error)
                                  : BorderSide(color: primary)),
                        ));
                  }),
              const SizedBox(
                height: 15,
              ),

              ValueListenableBuilder(
                  valueListenable: loginFailed,
                  builder: (context, widget, value) {
                    return TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelStyle: loginFailed.value
                              ? TextStyle(color: error)
                              : TextStyle(color: primary),
                          labelText: "Password",
                          enabledBorder: loginFailed.value
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      color:
                                          getEmphasis(error, emphasis.medium),
                                      width: 1))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      color: getEmphasis(
                                          onSurface, emphasis.medium),
                                      width: 1)),
                          focusedBorder: loginFailed.value
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      BorderSide(color: error, width: 2))
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      BorderSide(color: primary, width: 2)),
                          border: OutlineInputBorder(
                              borderSide: loginFailed.value
                                  ? BorderSide(color: error)
                                  : BorderSide(color: primary)),
                        ));
                  }),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 5,
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
                showBorder: false,
                radius: 20,
                style: ContainerStyle.primary,
                onTap: () {
                  HttpService(id: "login", percorso: "/bo", parametriHeaders: {
                    "nome": _nome.text.toString(),
                    "password": _password.text.toString()
                  }).get();
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
