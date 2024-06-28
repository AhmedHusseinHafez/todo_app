
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/resources/color_manager.dart';
import 'package:todo_app/core/resources/font_manager.dart';
import 'package:todo_app/core/resources/style_manager.dart';

mixin AppTheme implements ThemeData {
  static ThemeData get kLightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,

        //! Scaffold Color
        scaffoldBackgroundColor: const Color(0xffF2F5FA),

        // hintColor: ColorManager.whiteWithOpacity30,

        // primaryColor: ,
        // primaryColorLight: ,
        // primaryColorDark: ,
        // disabledColor: ColorManager.whiteWithOpacity30,
        splashColor: const Color(0xffD2DBEA),
        splashFactory: InkRipple.splashFactory,

        // //!Divider
        // dividerTheme: DividerThemeData(
        //   color: ColorManager.charcoal,
        //   indent: 6.w,
        //   endIndent: 6.w,
        //   thickness: 2,
        // ),

        // //!App bar
        // appBarTheme: AppBarTheme(
        //   systemOverlayStyle: Platform.isIOS
        //       ? null
        //       : const SystemUiOverlayStyle(
        //           statusBarColor: ColorManager.transparent,
        //           statusBarIconBrightness: Brightness.light,
        //           systemNavigationBarColor: ColorManager.richBlack,
        //         ),
        //   centerTitle: true,
        //   foregroundColor: ColorManager.white,
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   titleTextStyle: _myTextTheme().titleLarge,
        // ),

        //! Page Transition
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),

        //! Action Icon
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return const Icon(
              size: 30,
              Icons.arrow_back_rounded,
            );
          },
        ),

        // //!ElevatedButtonTheme
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     fixedSize: Size(327.w, 46.h),
        //     shape: const StadiumBorder(),
        //     backgroundColor: ColorManager.secondary,
        //     foregroundColor: ColorManager.white,
        //     textStyle: StyleManager.getMediumStyle(fontSize: FontSize.s12),
        //     surfaceTintColor: ColorManager.primary,
        //   ),
        // ),

        fontFamily: FontConstants.defaultFontFamily,

        // //!TextTheme
        // textTheme: _myTextTheme(),

        // textSelectionTheme: const TextSelectionThemeData(
        //   cursorColor: ColorManager.secondary,
        //   selectionColor: ColorManager.secondary,
        //   selectionHandleColor: ColorManager.secondary,
        // ),

        // //! TFF Theme
        // inputDecorationTheme: InputDecorationTheme(
        //   contentPadding: EdgeInsets.symmetric(
        //     horizontal: AppPadding.p16.w,
        //     vertical: AppPadding.p16.h,
        //   ),

        //   filled: true,
        //   fillColor: ColorManager.jetBlack,

        //   hintStyle: _getTFFFontStyle(),
        //   labelStyle: _getTFFFontStyle(),
        //   errorStyle: _getTFFFontStyle(error: true),
        //   //enabledBorder the border before click on field
        //   enabledBorder: _getTFFBorderStyle(),
        //   //focusedBorder the border after click on field
        //   focusedBorder: _getTFFBorderStyle(color: ColorManager.secondary),
        //   errorBorder: _getTFFBorderStyle(color: ColorManager.brightRed),
        //   focusedErrorBorder: _getTFFBorderStyle(),
        //   // disabledBorder: _getTFFBorderStyle(),
        //   border: _getTFFBorderStyle(),
        //   // iconColor: ColorManager.secondary,
        //   // suffixIconColor: ColorManager.secondary,
        // ),

        // textButtonTheme: TextButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor:
        //         const WidgetStatePropertyAll<Color>(ColorManager.transparent),
        //     foregroundColor:
        //         const WidgetStatePropertyAll<Color>(ColorManager.secondary),
        //     textStyle: WidgetStatePropertyAll<TextStyle>(
        //       StyleManager.getRegularStyle(fontSize: FontSize.s14),
        //     ),
        //   ),
        // ),

        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                const WidgetStatePropertyAll<Color>(ColorManager.transparent),
            iconColor: const WidgetStatePropertyAll<Color>(ColorManager.white),
            iconSize: WidgetStatePropertyAll<double>(8.w),
          ),
        ),

        listTileTheme: ListTileThemeData(
          tileColor: const Color(0xffD2DBEA),
          // textColor: ColorManager.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 4.5.h,
            horizontal: 9.w,
          ),
          visualDensity:
              const VisualDensity(vertical: VisualDensity.maximumDensity),
          // VisualDensity.comfortable,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          titleTextStyle: StyleManager.getLightStyle(
            fontSize: FontSize.s13,
            color: ColorManager.white,
          ),
          subtitleTextStyle: StyleManager.getLightStyle(
            fontSize: FontSize.s10,
            color: ColorManager.black,
          ),
          horizontalTitleGap: 21.w,
        ),

        //! Bottom Nav Bar Theme
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   selectedLabelStyle:
        //       StyleManager.getRegularStyle(fontSize: FontSize.s12),
        //   unselectedLabelStyle:
        //       StyleManager.getRegularStyle(fontSize: FontSize.s12),
        //   backgroundColor: ColorManager.richBlack,
        //   showSelectedLabels: true,
        //   showUnselectedLabels: true,
        //   selectedItemColor: ColorManager.secondary,
        //   unselectedItemColor: ColorManager.charcoalGray,
        //   type: BottomNavigationBarType.fixed,
        //   elevation: 0,
        // ),

        // //! Checkbox Theme
        // checkboxTheme: CheckboxThemeData(
        //   side: const BorderSide(width: 1),
        //   fillColor: const MaterialStatePropertyAll(ColorManager.secondary),
        //   checkColor: const MaterialStatePropertyAll(ColorManager.white),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        // ),
      );

  // static TextStyle _getTFFFontStyle({bool? error}) {
  //   return error ?? false
  //       ? StyleManager.getRegularStyle(
  //           color: ColorManager.brightRed,
  //           fontSize: FontSize.s13,
  //         )
  //       : StyleManager.getRegularStyle(
  //           color: ColorManager.whiteWithOpacity30,
  //           fontSize: FontSize.s13,
  //         );
  // }

  // static InputBorder _getTFFBorderStyle({Color? color}) {
  //   return OutlineInputBorder(
  //     borderSide: BorderSide(
  //       color: color ?? ColorManager.deepCharcoal,
  //       width: 1.w,
  //     ),
  //     borderRadius: BorderRadius.circular(
  //       100.r,
  //     ),
  //   );
  // }
}
