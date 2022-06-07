import 'package:flutter/material.dart';
import 'package:workout_app/screens/authentication/login_screen.dart';
import 'package:workout_app/services/background_video_service.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoName1 = "assets/videos/workout1.mp4";
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: BackgroundVideoService(videoAssetName: videoName1),
          ),
        ),
        Center(
          child: Text(
            'fitness'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 26,
                letterSpacing: 8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              child: SizedBox(
                width: 200,
                // height: 40,
                child: Text(
                  'let\'s start'.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
