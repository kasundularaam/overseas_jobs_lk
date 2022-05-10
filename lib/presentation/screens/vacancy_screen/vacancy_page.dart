import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../data/models/company_details.dart';
import '../../../data/models/hrm.dart';
import '../../../data/models/vacancy.dart';
import '../../../logic/cubit/apply_job_cubit/apply_job_cubit.dart';
import '../../../logic/cubit/organization_cubit/organization_cubit.dart';
import 'widgets/apply_job_card.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  const VacancyPage({
    Key? key,
    required this.vacancy,
  }) : super(key: key);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  Vacancy get vacancy => widget.vacancy;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrganizationCubit>(context)
        .loadOrganization(userId: vacancy.userId);
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: SafeArea(
        child: BlocConsumer<OrganizationCubit, OrganizationState>(
          listener: (context, state) {
            if (state is OrganizationFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is OrganizationLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
            if (state is OrganizationLoaded) {
              final HRM hrm = state.hrm;
              final CompanyDetails companyDetails = hrm.companyDetails;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          vacancy.jobTitle,
                          style: AppTextStyles.h1Primary,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          companyDetails.companyName,
                          style: AppTextStyles.h3Dark,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          companyDetails.emai,
                          style: AppTextStyles.p2Dark,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: AppColors.primaryColor,
                                    size: 22.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "Deadline:",
                                    style: AppTextStyles.p2Dark,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    vacancy.deadline,
                                    style: AppTextStyles.p2(Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_rounded,
                                    color: AppColors.primaryColor,
                                    size: 22.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "Candidates:",
                                    style: AppTextStyles.p2Dark,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    vacancy.candidates.length.toString(),
                                    style: AppTextStyles.p2Primary,
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
                                style: AppTextStyles.p2Dark,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BlocProvider(
                      create: (context) => ApplyJobCubit(),
                      child: ApplyJobCard(vacancyId: vacancy.id),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
