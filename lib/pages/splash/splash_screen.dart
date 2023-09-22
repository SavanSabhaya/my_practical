import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/image_constants.dart';
import 'package:practical/main.dart';
import 'package:practical/pages/splash/bloc/splash_bloc.dart';
import 'package:practical/utils/CustomSnackBar.dart';
import 'package:practical/utils/componets.dart';
import 'package:practical/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateState) {
            Navigator.pushReplacementNamed(context, routelogin);
          }
        },
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorConstants.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Image.asset(ImageConstants.imgSplash),
          );
        },
      ),
    );
  }
}
