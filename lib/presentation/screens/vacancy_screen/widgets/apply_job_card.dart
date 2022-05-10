import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../logic/cubit/apply_job_cubit/apply_job_cubit.dart';

class ApplyJobCard extends StatefulWidget {
  final String vacancyId;
  const ApplyJobCard({
    Key? key,
    required this.vacancyId,
  }) : super(key: key);

  @override
  State<ApplyJobCard> createState() => _ApplyJobCardState();
}

class _ApplyJobCardState extends State<ApplyJobCard> {
  String get vacancyId => widget.vacancyId;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ApplyJobCubit>(context).load(vacancyId: vacancyId);
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Apply",
            style: AppTextStyles.h3Dark,
          ),
          SizedBox(
            height: 1.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: BlocConsumer<ApplyJobCubit, ApplyJobState>(
              listener: (context, state) {
                if (state is ApplyJobFailed) {
                  SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is ApplyJobLoading) {
                  return const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  );
                }
                if (state is ApplyJobApply) {
                  return ElevatedButton(
                    onPressed: () => BlocProvider.of<ApplyJobCubit>(context)
                        .apply(vacancyId: vacancyId),
                    child: const Text("Apply"),
                  );
                }
                if (state is ApplyJobApplied) {
                  return Text(
                    "Applied",
                    style: AppTextStyles.h4(Colors.green),
                  );
                }
                return ElevatedButton(
                  onPressed: () => {},
                  child: const Text("Apply"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
