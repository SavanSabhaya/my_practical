import 'package:practical/api_service/api_constant.dart';
import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/image_constants.dart';
import 'package:practical/pages/dashbord/bloc/dashbord_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical/common/constants/font_constants.dart';
import 'package:practical/common/widgets/common_button.dart';
import 'package:practical/common/widgets/common_textformfield.dart';
import 'package:practical/utils/app_theme.dart';
import 'package:practical/utils/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashbordScreen extends StatelessWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashbordBloc, DashbordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorConstants.primaryColor,
                elevation: 0,
                leading: Icon(Icons.drag_handle),
                actions: [
                  InkWell(onTap: () {}, child: SvgPicture.asset(ImageConstants.svgnotification)),
                ],
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.8,
                        width: double.infinity,
                        color: ColorConstants.primaryColor,
                        padding: EdgeInsets.only(top: 50, left: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration:
                                      BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(30)),
                                  child: /*  state.data?.user?.profileImage != null
                                      ? Image.network("${ApiConstant.baseUrl}${state.data?.user?.profileImage}")
                                      : */
                                      Image.asset(ImageConstants.imgSplash)),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.data != null ? state.data?.user?.fullName : 'Welcome back'}",
                                    style: AppThemeState().textStyleBold(ColorConstants.textColor,
                                        fontSize: FontConstants.font_20, decoration: TextDecoration.none),
                                  ),
                                  Text(
                                    "${state.data != null ? state.data?.user?.cmpName : 'Welcome back'}",
                                    style: AppThemeState().textStyleLight(ColorConstants.textColor,
                                        fontSize: FontConstants.font_16, decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, routeUserProfile);
                                  },
                                  child: SvgPicture.asset(ImageConstants.svgedit)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, routeLeadPage);
                              },
                              child: Card(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 10,
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(ImageConstants.svgfilter),
                                        SizedBox(height: 10),
                                        Text(
                                          'Leads',
                                          style: AppThemeState().textStyleBold(Colors.black,
                                              fontSize: FontConstants.font_12, decoration: TextDecoration.none),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(ImageConstants.svgshape),
                                      SizedBox(height: 10),
                                      Text(
                                        'Tasks',
                                        style: AppThemeState().textStyleBold(Colors.black,
                                            fontSize: FontConstants.font_12, decoration: TextDecoration.none),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Follow up\ Lead',
                                        style: AppThemeState().textStyleBold(Colors.black,
                                            fontSize: FontConstants.font_12, decoration: TextDecoration.none),
                                      )
                                    ]),
                              ),
                            ),
                            Card(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Due Follow up Lead',
                                        textAlign: TextAlign.center,
                                        style: AppThemeState().textStyleBold(Colors.black,
                                            fontSize: FontConstants.font_12, decoration: TextDecoration.none),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
