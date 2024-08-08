import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/routes/app_routes.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.15)),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 70.0,
              horizontal: 40.0,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectTheme(context, AppVectors.moon, 'Dark Mode'),
                    const SizedBox(width: 80),
                    selectTheme(context, AppVectors.sun, 'Light Mode'),
                  ],
                ),
                const SizedBox(height: 90),
                BasicAppButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.signupOrSignin);
                  },
                  title: 'Continue',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget selectTheme(BuildContext context, String vector, String text) {
    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().updateTheme(
              vector == AppVectors.moon ? ThemeMode.dark : ThemeMode.light,
            );
      },
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF30393C).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(vector, fit: BoxFit.none),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
