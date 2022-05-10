import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_colors.dart';
import '../../../logic/cubit/complaints_cubit/complaints_cubit.dart';
import '../../../logic/cubit/connections_cubit/connections_cubit.dart';
import '../../../logic/cubit/new_complaint_cubit/new_complaint_cubit.dart';
import '../../../logic/cubit/ojlk_user_cubit/ojlk_user_cubit.dart';
import '../../../logic/cubit/upload_docs_cubit/upload_docs_cubit.dart';
import '../../../logic/cubit/vacancies_cubit/vacancies_cubit.dart';
import 'pages/complaint_page.dart';
import 'pages/connections_page.dart';
import 'pages/home_page.dart';
import 'pages/vacancies_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> widgetOptions = [
    BlocProvider(
      create: (context) => VacanciesCubit(),
      child: const VacanciesPage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ComplaintsCubit()),
        BlocProvider(create: (context) => NewComplaintCubit()),
      ],
      child: const ComplaintPage(),
    ),
    BlocProvider(
      create: (context) => ConnectionsCubit(),
      child: const ConnectionsPage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OJLKUserCubit()),
        BlocProvider(create: (context) => UploadDocsCubit()),
      ],
      child: const HomePage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv1,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv1,
        body: SafeArea(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.work_rounded),
              label: "Vacancies",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback_rounded),
              label: "Complaint",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_rounded),
              label: "Connections",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
              backgroundColor: AppColors.primaryColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.lightElv0,
          unselectedItemColor: AppColors.lightElv0.withOpacity(0.7),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
        ),
      ),
    );
  }
}
