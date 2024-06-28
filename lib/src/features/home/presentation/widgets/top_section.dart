import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/common.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.homeHeadLine,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        10.verticalSpace,
        Row(
          children: [
            Text(
              StringsManager.today,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            5.horizontalSpace,
            Text(
              dayFormate(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorManager.primary),
            ),
          ],
        ),
        Text(
          DateFormat('MMM,d,yyyy').format(DateTime.now()),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
