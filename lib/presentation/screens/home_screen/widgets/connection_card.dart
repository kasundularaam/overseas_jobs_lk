import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/models/connection_user.dart';
import '../../../../logic/cubit/connection_cubit/connection_cubit.dart';

class ConnectionCard extends StatefulWidget {
  final ConnectionUser connectionUser;
  const ConnectionCard({
    Key? key,
    required this.connectionUser,
  }) : super(key: key);

  @override
  State<ConnectionCard> createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  ConnectionUser get connectionUser => widget.connectionUser;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserConnectionCubit>(context)
        .loadConnection(connectionId: connectionUser.id);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: AppColors.lightElv0,
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      connectionUser.name,
                      style: AppTextStyles.h4Dark,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      connectionUser.profession,
                      style: AppTextStyles.p2Dark,
                    )
                  ],
                ),
              ),
              BlocConsumer<UserConnectionCubit, UserConnectionState>(
                listener: (context, state) {
                  if (state is UserConnectionFailed) {
                    SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is UserConnectionLoaded) {
                    if (state.isConnected) {
                      return TextButton(
                          onPressed: () =>
                              BlocProvider.of<UserConnectionCubit>(context)
                                  .disConnect(connectionId: connectionUser.id),
                          child: const Text("remove"));
                    } else {
                      return TextButton(
                          onPressed: () =>
                              BlocProvider.of<UserConnectionCubit>(context)
                                  .connect(connectionId: connectionUser.id),
                          child: const Text("add"));
                    }
                  }
                  return const Text("...");
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
