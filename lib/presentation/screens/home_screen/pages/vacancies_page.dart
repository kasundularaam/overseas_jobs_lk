import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../logic/cubit/vacancies_cubit/vacancies_cubit.dart';
import '../widgets/vacancy_card.dart';

class VacanciesPage extends StatefulWidget {
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  State<VacanciesPage> createState() => _VacanciesPageState();
}

class _VacanciesPageState extends State<VacanciesPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VacanciesCubit>(context).loadVacancies();
    return Column(
      children: [
        Container(
          color: AppColors.primaryColor,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Text(
            "Vacancies",
            style: AppTextStyles.h2Light,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        BlocConsumer<VacanciesCubit, VacanciesState>(
          listener: (context, state) {
            if (state is VacanciesFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is VacanciesLoading) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ));
            }
            if (state is VacanciesLoaded) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  itemCount: state.vacancies.length,
                  itemBuilder: (context, index) =>
                      VacancyCard(vacancy: state.vacancies[index]),
                ),
              );
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
