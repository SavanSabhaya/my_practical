import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/image_constants.dart';
import 'package:practical/common/enums/loading_status.dart';
import 'package:practical/pages/lead_page/bloc/lead_page_bloc.dart';
import 'package:practical/utils/CustomSnackBar.dart';

class LeadPageScreen extends StatelessWidget {
  const LeadPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeadPageBloc, LeadPageState>(listener: (context, state) {
      if (state.status == LoadStatus.validationError) {
        showErrorSnackBar(context, state.message);
      } else if (state.status == LoadStatus.failure) {
        EasyLoading.dismiss();
        showErrorSnackBar(context, state.message);
      } else if (state.status == LoadStatus.success) {
        EasyLoading.dismiss();
        showSuccessSnackBar(context, state.message);
      } else if (state.status == LoadStatus.loading) {
        // EasyLoading.show(dismissOnTap: true);
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstants.primaryColor,
            elevation: 0,
            leading: const Icon(Icons.drag_handle),
            title: const Text('Leads'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(ImageConstants.svgplush),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                            hintText: "Search",
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB3B1B1),
                            ),
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 26,
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 2.0,
                                color: Color(0xFFFF0000),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 2.0,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 2.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                          child: SvgPicture.asset(ImageConstants.svgfilter)),
                      const SizedBox(width: 5),
                      Container(child: SvgPicture.asset(ImageConstants.svgshorting)),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ankit Patel item ${index}",
                                    style: const TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.green),
                                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                                      child: Text("Qualified"),
                                    ),
                                  )
                                ],
                              ),
                              const Text("iBoon Technologies", style: TextStyle(fontSize: 15, color: Colors.grey)),
                              const Text("Just Dial", style: TextStyle(fontSize: 15, color: Colors.grey)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ));
    });
  }
}
