 import 'package:e_quran/screen/list_surah_screen.dart';
import 'package:e_quran/utils/shared_preferences.dart';
import 'package:e_quran/screen/widget/button_custome.dart';
import 'package:e_quran/screen/widget/textfield_custom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Property Username
  String _username = "";
  bool _isusernamevalid = true;
  String _Usernameerrormessage = "";

  //Property Password
  String _password = "";
  bool _ispasswordvalid = true;
  String _passworderrormessage = "";
  bool _isHidepassword = true;

  //Property Button
  bool _isButtonUsernamedisable = false;
  bool _isButtonPassworddisable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 137, 218, 168),
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [

              const SizedBox(height: 80,),
              const Icon(
                Icons.login_rounded,
                size: 120,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    // Username Field
                    TextFieldCustome(
                      onChanged: (value) {
                        _username = value;
                        if (_username.isEmpty) {
                          _isusernamevalid = false;
                          _isButtonUsernamedisable = false;
                          _Usernameerrormessage =
                              'Username Tidak Boleh Kosong!!!';
                        } else if (_username.length < 4) {
                          _isusernamevalid = false;
                          _isButtonUsernamedisable = false;
                          _Usernameerrormessage =
                              "Username Harus Lebih dari 4 Huruf";
                        } else {
                          _isusernamevalid = true;
                          _isButtonUsernamedisable = true;
                        }
                        setState(() {});
                      },
                      hintText: 'Username',
                      isValidtextfield: _isusernamevalid,
                      errorMessage: _Usernameerrormessage,
                    ),
                    //Done Username

                    // Field Password
                    TextFieldCustome(
                      onChanged: (value) {
                        _password = value;
                        if (_password.isEmpty) {
                          _passworderrormessage = "Password Tidak Boleh Kosong";
                          _ispasswordvalid = false;
                          _isButtonPassworddisable = false;
                        } else {
                          _ispasswordvalid = true;
                          _isButtonPassworddisable = true;
                        }
                        setState(() {});
                      },
                      isObscureText: _isHidepassword,
                      isValidtextfield: _ispasswordvalid,
                      errorMessage: _passworderrormessage,
                      hintText: 'Password',
                      suffixIconWidget: IconButton(
                        onPressed: () {
                          _isHidepassword = !_isHidepassword;
                          setState(() {});
                        },
                        icon: _isHidepassword
                            ? const Icon(Icons.lock)
                            : const Icon(Icons.lock_open),
                      ),
                    ),
                    //Done Password

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              //Button login
              ButtonCustome(
                onPressed: _isButtonUsernamedisable && _isButtonPassworddisable
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ListSurahScreen(),
                          ),
                        );
                        SaveToken(key: keyToken, valueToken: _username);
                        SaveToken(key: keyPassword, valueToken: _password);
                      }
                    : null,
                title: 'Login',
                isIcon: true,
                icon: const Icon(Icons.login_rounded),
              ),
              //Done
            ],
          ),
        ));
  }
}
