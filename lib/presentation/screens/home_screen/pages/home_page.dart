import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../logic/cubit/ojlk_user_cubit/ojlk_user_cubit.dart';
import '../../../../logic/cubit/upload_docs_cubit/upload_docs_cubit.dart';
import '../widgets/document_card.dart';
import '../widgets/location_card.dart';
import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OJLKUserCubit>(context).getUser();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Text(
              "Profile",
              style: AppTextStyles.h2Light,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocConsumer<OJLKUserCubit, OJLKUserState>(
            listener: (context, state) {
              if (state is OJLKUserFailed) {
                SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is OJLKUserLoading) {
                return const Expanded(
                    child: Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                ));
              }
              if (state is OJLKUserLoaded) {
                return Column(
                  children: [
                    UserCard(
                      user: state.user,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocProvider(
                      create: (context) => UploadDocsCubit(),
                      child: const DocumentCard(),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    const LocationCard(),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
