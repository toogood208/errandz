import 'package:errandz/res/dimension.dart';
import 'package:errandz/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSheet {
  static void bottomSheet(context,
      {required Widget child, double? height, String? title}) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: height ?? size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  //physics: ClampingScrollPhysics(),
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Divider(
                        thickness: 3,
                        endIndent: 2,
                        indent: 2,
                      ),
                    ),
                    AppDimension.space5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Ink(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Theme.of(context).dividerColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.close,
                              size: 20.r,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      title ?? '',
                      style: AppTextStyle.monte20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    AppDimension.space10,
                    child,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
