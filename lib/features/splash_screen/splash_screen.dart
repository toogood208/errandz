import 'package:errandz/features/widgets/app_title_heading.dart';
import 'package:errandz/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppTitleHeading(),
          AppDimension.space10,
          SizedBox(
            height: 10,
            width: 10,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
