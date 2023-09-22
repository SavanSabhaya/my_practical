import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/font_constants.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/common/widgets/common_button.dart';
import 'package:practical/common/widgets/common_textformfield.dart';
import 'package:practical/pages/login/bloc/login_bloc.dart';
import 'package:practical/utils/CustomSnackBar.dart';
import 'package:practical/utils/app_theme.dart';
import 'package:practical/utils/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoadStatus.validationError) {
            showErrorSnackBar(context, state.message);
          } else if (state.status == LoadStatus.failure) {
            EasyLoading.dismiss();
            showErrorSnackBar(context, state.message);
          } else if (state.status == LoadStatus.success) {
            EasyLoading.dismiss();
            Navigator.pushReplacementNamed(context, routeDashboard, arguments: {'getData': state.data});
            showSuccessSnackBar(context, state.message);
          } else if (state.status == LoadStatus.loading) {
            EasyLoading.show(dismissOnTap: true);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    color: ColorConstants.primaryColor,
                    padding: EdgeInsets.only(top: 150, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: AppThemeState().textStyleRegular(ColorConstants.textColor,
                              fontSize: FontConstants.font_26, decoration: TextDecoration.none),
                        ),
                        Text(
                          'Welcome back',
                          style: AppThemeState().textStyleLight(ColorConstants.textColor,
                              fontSize: FontConstants.font_16, decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      CommonTextFormField(
                          editController: emailController,
                          focusNode: emailNode,
                          labelText: 'Email',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: passwordController,
                          focusNode: passwordNode,
                          labelText: 'Password',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 30),
                      CommonButton(
                        buttonText: 'Login',
                        onTap: () {
                          context.read<LoginBloc>().add(ValidateEvent(emailController.text, passwordController.text));
                        },
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: AppThemeState().textStyleRegular(Colors.grey,
                              fontSize: FontConstants.font_12, decoration: TextDecoration.none),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don\'t have an account\?',
                            style: AppThemeState().textStyleRegular(Colors.grey, fontSize: FontConstants.font_12)),
                        TextSpan(
                          text: ' Sign up',
                          style: AppThemeState().textStyleMedium(ColorConstants.primaryColor,
                              fontSize: FontConstants.font_14, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.popAndPushNamed(context, routeRegister);
                              emailController.clear();
                              passwordController.clear();
                              //Navigator.pushNamed(context, routeWebView, arguments: {"title": privacyPolicyName, "url": '${initModel?.baseUrl}$privacyPolicy'});
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
