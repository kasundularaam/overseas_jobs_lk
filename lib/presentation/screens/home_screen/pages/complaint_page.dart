import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../logic/cubit/complaints_cubit/complaints_cubit.dart';
import '../../../../logic/cubit/new_complaint_cubit/new_complaint_cubit.dart';
import '../widgets/complaint_card.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ComplaintsCubit>(context).getComplaints();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Text(
              "Complaints",
              style: AppTextStyles.h2Light,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New complaint",
                  style: AppTextStyles.h4Dark,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  controller: messageController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  minLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: BlocConsumer<NewComplaintCubit, NewComplaintState>(
                    listener: (context, state) {
                      if (state is NewComplaintFailed) {
                        SnackBar snackBar =
                            SnackBar(content: Text(state.errorMsg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (state is NewComplaintSucceed) {
                        messageController.clear();
                        SnackBar snackBar = const SnackBar(
                            content: Text("Your complaint added"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        BlocProvider.of<ComplaintsCubit>(context)
                            .getComplaints();
                      }
                    },
                    builder: (context, state) {
                      if (state is NewComplaintLoading) {
                        return const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        );
                      }
                      return ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<NewComplaintCubit>(context)
                                .addComplaint(message: messageController.text),
                        child: Text(
                          "Send",
                          style: AppTextStyles.p2Light,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 1.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                "your complaints",
                style: AppTextStyles.h4Primary,
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocConsumer<ComplaintsCubit, ComplaintsState>(
            listener: (context, state) {
              if (state is ComplaintsFailed) {
                SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is ComplaintsLoading) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              }
              if (state is ComplaintsLoaded) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  itemCount: state.complaints.length,
                  itemBuilder: (context, index) =>
                      ComplaintCard(complaint: state.complaints[index]),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
