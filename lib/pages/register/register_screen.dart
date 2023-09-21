import 'dart:ffi';

import 'package:practical/pages/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/font_constants.dart';
import 'package:practical/common/widgets/common_button.dart';
import 'package:practical/common/widgets/common_textformfield.dart';
import 'package:practical/utils/app_theme.dart';
import 'package:practical/utils/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cfPasswordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final nameNode = FocusNode();

  final numberNode = FocusNode();

  final emailNode = FocusNode();

  final passwordNode = FocusNode();

  final cfpasswordNode = FocusNode();
  final compnayNameNode = FocusNode();
  final addNode = FocusNode();
  final imageNode = FocusNode();

  bool ischnage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {},
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
                          ischnage ? 'Signup' : "Company Details",
                          style: AppThemeState().textStyleRegular(
                              ColorConstants.textColor,
                              fontSize: FontConstants.font_26,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          ischnage
                              ? 'Enter your details to create your account'
                              : "Enter your company details \nto create your account",
                          style: AppThemeState().textStyleLight(
                              ColorConstants.textColor,
                              fontSize: FontConstants.font_16,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Visibility(
                visible: ischnage,
                child: Center(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        CommonTextFormField(
                            editController: nameController,
                            focusNode: nameNode,
                            labelText: 'Full Name',
                            onChange: (p0) {},
                            inputBorders: OutlineInputBorder(),
                            labelTextstyle:
                                TextStyle(color: ColorConstants.blackColor),
                            textInputType: TextInputType.name),
                        SizedBox(height: 10),
                        CommonTextFormField(
                            editController: numberController,
                            focusNode: numberNode,
                            labelText: 'Contect No',
                            onChange: (p0) {},
                            inputBorders: OutlineInputBorder(),
                            labelTextstyle:
                                TextStyle(color: ColorConstants.blackColor),
                            textInputType: TextInputType.phone),
                        SizedBox(height: 10),
                        CommonTextFormField(
                            editController: emailController,
                            focusNode: emailNode,
                            labelText: 'Email',
                            onChange: (p0) {},
                            inputBorders: OutlineInputBorder(),
                            labelTextstyle:
                                TextStyle(color: ColorConstants.blackColor),
                            textInputType: TextInputType.emailAddress),
                        SizedBox(height: 10),
                        CommonTextFormField(
                            editController: passwordController,
                            focusNode: passwordNode,
                            labelText: 'Password',
                            onChange: (p0) {},
                            inputBorders: OutlineInputBorder(),
                            labelTextstyle:
                                TextStyle(color: ColorConstants.blackColor),
                            textInputType: TextInputType.visiblePassword),
                        SizedBox(height: 10),
                        CommonTextFormField(
                            editController: cfPasswordController,
                            focusNode: cfpasswordNode,
                            labelText: 'Confirm Password',
                            onChange: (p0) {},
                            inputBorders: OutlineInputBorder(),
                            labelTextstyle:
                                TextStyle(color: ColorConstants.blackColor),
                            textInputType: TextInputType.visiblePassword),
                        SizedBox(height: 30),
                        Flexible(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CommonButton(
                                  buttonText: 'Next',
                                  onTap: () {
                                    setState(() {
                                      ischnage = !ischnage;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                flex: 1,
                                child: CommonButton(
                                  backgroundColor: ColorConstants.whiteColor,
                                  textColor: ColorConstants.primaryColor,
                                  isBorder: false,
                                  buttonText: 'Cancel',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !ischnage,
                child: Center(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonTextFormField(
                                editController: companyNameController,
                                focusNode: compnayNameNode,
                                labelText: 'Company Name',
                                onChange: (p0) {},
                                inputBorders: OutlineInputBorder(),
                                textInputType: TextInputType.name),
                            SizedBox(height: 10),
                            CommonTextFormField(
                                editController: addController,
                                focusNode: addNode,
                                labelText: 'Company address',
                                onChange: (p0) {},
                                inputBorders: OutlineInputBorder(),
                                textInputType: TextInputType.name),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 10, bottom: 10),
                              child: Text(
                                'Company Logo',
                                style: AppThemeState().textStyleMedium(
                                    ColorConstants.blackColor,
                                    fontSize: FontConstants.font_18,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            CommonTextFormField(
                                editController: imageController,
                                focusNode: imageNode,
                                labelText: 'Choose File   No File Chosen',
                                isEnabled: false,
                                onChange: (p0) {},
                                inputBorders: OutlineInputBorder(),
                                textInputType: TextInputType.name),
                            SizedBox(height: 30),
                            Flexible(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CommonButton(
                                      buttonText: 'Submit',
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              routeDashboard,
                                              (route) => false);
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                ],
                              ),
                            ),
                          ]),
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
