import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/widgets/common_button.dart';
import 'package:practical/common/widgets/common_textformfield.dart';
import 'package:practical/pages/profile/bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNamecontroller = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  final nameNode = FocusNode();

  final numberNode = FocusNode();
  final companyNameNode = FocusNode();

  final emailNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
        leading: Icon(Icons.drag_handle),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
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
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/logo.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          editController: companyNamecontroller,
                          focusNode: companyNameNode,
                          labelText: 'Company Name',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle:
                              TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.phone),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: emailController,
                          focusNode: emailNode,
                          labelText: 'Email id',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle:
                              TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: numberController,
                          focusNode: numberNode,
                          labelText: 'Mobile No',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle:
                              TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.phone),
                      SizedBox(height: 30),
                      Flexible(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonButton(
                                buttonText: 'Submit',
                                onTap: () {},
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
            ],
          );
        },
      ),
    );
  }
}
