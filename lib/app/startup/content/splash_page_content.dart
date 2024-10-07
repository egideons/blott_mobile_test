import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/constants/consts.dart';

StartupSplashScreen(Size media, ColorScheme colorScheme) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Container(
      //   height: media.height / 4,
      //   width: media.width / 2,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //          Assets.transparentAppIcon,
      //       ),
      //     ),
      //   ),
      // ),
      Image.asset(
        Assets.appIconSvg,
        height: media.height / 4,
        width: media.width / 2,
      ),
      const SizedBox(height: kDefaultPadding * 2),
      LoadingAnimationWidget.staggeredDotsWave(
        color: colorScheme.primary,
        size: 50,
      ),
    ],
  );
}
