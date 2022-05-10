import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/models/complaint.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;
  const ComplaintCard({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: AppColors.darkElv0.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You",
                        style: AppTextStyles.h4Primary,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        complaint.complaintMessage,
                        style: AppTextStyles.p2Dark,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          complaint.responseMessage.isEmpty
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Not responded yet*",
                    style: AppTextStyles.p3Primary,
                  ),
                )
              : Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Berue Office",
                              style: AppTextStyles.h4Primary,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              complaint.responseMessage,
                              style: AppTextStyles.p2Dark,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 1.h,
          ),
          const Divider(),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
