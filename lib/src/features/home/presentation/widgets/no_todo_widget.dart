import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';

import '../../../../core/resources/assets_manager.dart';

class NoToDosWidget extends StatelessWidget {
  const NoToDosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          0.2.sh.verticalSpace,
          SvgPicture.asset(AssetsManager.noData),
          10.verticalSpace,
          Text(
            StringsManager.noToDosFound,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorManager.primary,
                ),
          )
        ],
      ),
    );
  }
}
