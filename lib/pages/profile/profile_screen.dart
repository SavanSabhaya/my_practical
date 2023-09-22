import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/image_constants.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/common/widgets/common_button.dart';
import 'package:practical/common/widgets/common_textformfield.dart';
import 'package:practical/pages/profile/bloc/profile_bloc.dart';
import 'package:practical/pages/register/model.dart';
import 'package:practical/utils/CustomSnackBar.dart';

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
  XFile? profileImage;

  User? user;
  @override
  void initState() {
    super.initState();
    nameController.text = user?.fullName ?? "";
    companyNamecontroller.text = user?.cmpName ?? "";
    emailController.text = user?.userName ?? "";
    numberController.text = user?.contactNo.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
        leading: Icon(Icons.drag_handle),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileInitstate) {
            user = state.user;
            nameController.text = state.user?.fullName ?? "";
            companyNamecontroller.text = state.user?.cmpName ?? "";
            emailController.text = state.user?.userName ?? "";
            numberController.text = state.user?.contactNo.toString() ?? '';
          }
          if (state.status == LoadStatus.validationError) {
            showErrorSnackBar(context, state.message);
          } else if (state.status == LoadStatus.failure) {
            EasyLoading.dismiss();
            showErrorSnackBar(context, state.message);
          } else if (state.status == LoadStatus.success) {
            EasyLoading.dismiss();
            showSuccessSnackBar(context, state.message);
          } else if (state.status == LoadStatus.loading) {
            EasyLoading.show(dismissOnTap: true);
          } else if (state is updateState) {
            Navigator.pop(context);
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
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(ImageConstants.imgSplash),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                final ImagePicker picker = ImagePicker();
                                picker.pickImage(source: ImageSource.camera).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      profileImage = value;
                                    });
                                  }
                                });
                              },
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
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.name),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: companyNamecontroller,
                          focusNode: companyNameNode,
                          labelText: 'Company Name',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.name),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: emailController,
                          focusNode: emailNode,
                          labelText: 'Email id',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 10),
                      CommonTextFormField(
                          editController: numberController,
                          focusNode: numberNode,
                          labelText: 'Mobile No',
                          onChange: (p0) {},
                          inputBorders: OutlineInputBorder(),
                          labelTextstyle: TextStyle(color: ColorConstants.blackColor),
                          textInputType: TextInputType.phone),
                      SizedBox(height: 30),
                      Flexible(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonButton(
                                buttonText: 'Submit',
                                onTap: () {
                                  if (profileImage != null) {
                                    context.read<ProfileBloc>().add(ValidateEvent(
                                        nameController.text,
                                        companyNamecontroller.text,
                                        numberController.text,
                                        emailController.text,
                                        profileImage));
                                  } else {
                                    showErrorSnackBar(context, 'please select image');
                                  }
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
            ],
          );
        },
      ),
    );
  }
}
