import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/models/vacancy.dart';
import '../../../router/app_router.dart';

class VacancyCard extends StatelessWidget {
  final Vacancy vacancy;
  const VacancyCard({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRouter.vacancyPage,
              arguments: vacancy),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightElv0,
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vacancy.jobTitle,
                    style: AppTextStyles.h3Dark,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Candidates",
                            style: AppTextStyles.p2Dark,
                          ),
                          Text(
                            vacancy.candidates.length.toString(),
                            style: AppTextStyles.p2Dark,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Deadline",
                            style: AppTextStyles.p2Dark,
                          ),
                          Text(
                            vacancy.deadline,
                            style: AppTextStyles.p2(Colors.red),
                          ),
                        ],
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
                  Text(
                    vacancy.jobDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.p2Dark,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
