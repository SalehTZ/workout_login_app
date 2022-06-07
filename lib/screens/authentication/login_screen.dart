import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/theme.dart';
import '../../services/background_video_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController? usernameController;
  TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    //* path to your local background video
    //* please refer to video_player package docs to
    //* videos from internet
    String videoName = "assets/videos/workout2.mp4";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: BackgroundVideoService(videoAssetName: videoName),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: size.width * 0.27),
                    const StayfitLogoWidget(text: "Login to stay fit"),
                    SizedBox(height: size.width * 0.15),
                    usernameTextField(),
                    SizedBox(height: size.width * 0.1),
                    passwordTextField(),
                    SizedBox(height: size.width * 0.11),
                    signInButton(size),
                    const SizedBox(height: 10),
                    forgetPassword(),
                    const SizedBox(height: 20),
                    LoginMethodsRow(size: size),
                    const SizedBox(height: 20),
                    signUpTextView()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton signInButton(Size size) {
    return ElevatedButton(
      onPressed: () {
        //TODO: add your login logics here
      },
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(Colors.white38),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: SizedBox(
        width: size.width * 0.35,
        // height: 40,
        child: const Text(
          'Sign in',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 19,
              letterSpacing: 1),
        ),
      ),
    );
  }

  GestureDetector signUpTextView() {
    return GestureDetector(
      onTap: () {
        //TODO: navigate to sign up screen
      },
      child: const Text(
        "Don't have account? sign up now",
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  GestureDetector forgetPassword() {
    return GestureDetector(
      onTap: () {
        //TODO: add your 'forget password' logic
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  TextFormField usernameTextField() {
    return TextFormField(
      controller: usernameController,
      style: const TextStyle(color: Colors.white),
      decoration: textFieldInputDecoration(hintText: "Email or Username"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      controller: passwordController,
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      decoration:
          textFieldInputDecoration(hintText: "Password", isObscure: false),
    );
  }
}

class StayfitLogoWidget extends StatelessWidget {
  const StayfitLogoWidget({
    Key? key,
    required String this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: 15,
          child: SvgPicture.asset(
            //TODO: you can change your logo here
            "assets/icons/dumbbell.svg",
            width: width * 0.18,
            height: width * 0.18,
            color: Colors.white,
          ),
        ),
        SizedBox(height: width * 0.05),
        Text(
          text.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class LoginMethodsRow extends StatelessWidget {
  const LoginMethodsRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              //TODO: add your logic to login via facebook
            },
            child: const Icon(FontAwesomeIcons.facebookF, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              //TODO: add your logic to login via twitter
            },
            child: const Icon(FontAwesomeIcons.twitter, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              //TODO: add your logic to login via google
            },
            child:
                const Icon(FontAwesomeIcons.googlePlusG, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
