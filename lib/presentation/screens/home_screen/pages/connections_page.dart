import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../logic/cubit/connection_cubit/connection_cubit.dart';
import '../../../../logic/cubit/connections_cubit/connections_cubit.dart';
import '../widgets/connection_card.dart';

class ConnectionsPage extends StatefulWidget {
  const ConnectionsPage({Key? key}) : super(key: key);

  @override
  State<ConnectionsPage> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {
  bool isUsers = true;
  @override
  Widget build(BuildContext context) {
    if (isUsers) {
      BlocProvider.of<ConnectionsCubit>(context).loadUsers();
    } else {
      BlocProvider.of<ConnectionsCubit>(context).loadConnections();
    }

    return Column(
      children: [
        Container(
          color: AppColors.primaryColor,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Text(
            "Connections",
            style: AppTextStyles.h2Light,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {
                setState(() {
                  isUsers = true;
                });
              },
              child: Text(
                "Users",
                style: isUsers ? AppTextStyles.p1Primary : AppTextStyles.p1Dark,
              ),
            )),
            Expanded(
                child: TextButton(
              onPressed: () {
                setState(() {
                  isUsers = false;
                });
              },
              child: Text(
                "Connections",
                style: isUsers ? AppTextStyles.p1Dark : AppTextStyles.p1Primary,
              ),
            ))
          ],
        ),
        Container(
          color: AppColors.primaryColor,
          width: 100.w,
          height: 0.1.h,
        ),
        BlocConsumer<ConnectionsCubit, ConnectionsState>(
          listener: (context, state) {
            if (state is ConnectionsFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is ConnectionsLoading) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ));
            }
            if (state is ConnectionsLoaded) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  itemCount: state.connectionUsers.length,
                  itemBuilder: (context, index) => BlocProvider(
                    create: (context) => UserConnectionCubit(),
                    child: ConnectionCard(
                        connectionUser: state.connectionUsers[index]),
                  ),
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
