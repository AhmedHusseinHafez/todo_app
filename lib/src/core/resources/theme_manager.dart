import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';

mixin AppTheme implements ThemeData {
  static ThemeData get kLightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,

        //! Scaffold Color
        scaffoldBackgroundColor: ColorManager.white,

        // hintColor: ColorManager.whiteWithOpacity30,

        // primaryColor: ,
        // primaryColorLight: ,
        // primaryColorDark: ,
        // disabledColor: ColorManager.whiteWithOpacity30,
        // splashColor: const Color(0xffD2DBEA),
        splashFactory: InkRipple.splashFactory,

        // //!Divider
        // dividerTheme: DividerThemeData(
        //   color: ColorManager.charcoal,
        //   indent: 6.w,
        //   endIndent: 6.w,
        //   thickness: 2,
        // ),

        ///!App bar
        appBarTheme: AppBarTheme(
          surfaceTintColor: ColorManager.white,
          centerTitle: false,
          foregroundColor: ColorManager.black,
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: _myTextTheme().titleMedium,
        ),

        //! Action Icon
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return const Icon(
              size: 20,
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
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

        ///!TextTheme
        textTheme: _myTextTheme(),

    

        ///! TFF Theme
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16.w,
            vertical: AppPadding.p16.h,
          ),

          filled: true,
          fillColor: ColorManager.white,

          hintStyle: _getTFFFontStyle(),
          labelStyle: _getTFFFontStyle(),
          errorStyle: _getTFFFontStyle(error: true),
          //enabledBorder the border before click on field
          enabledBorder: _getTFFBorderStyle(),
          //focusedBorder the border after click on field
          focusedBorder: _getTFFBorderStyle(color: ColorManager.primary),
          errorBorder: _getTFFBorderStyle(color: ColorManager.red),
          focusedErrorBorder: _getTFFBorderStyle(),
          // disabledBorder: _getTFFBorderStyle(),
          border: _getTFFBorderStyle(),
          // iconColor: ColorManager.secondary,
          // suffixIconColor: ColorManager.secondary,
        ),

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

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          iconSize: 30,
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
        ),

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
          titleTextStyle: StyleManager.getSemiBoldStyle(
            fontSize: FontSize.s22,
            color: ColorManager.primary,
          ),
          subtitleTextStyle: StyleManager.getMediumStyle(
            fontSize: FontSize.s10,
            color: ColorManager.black,
          ),
          horizontalTitleGap: 10.w,
        ),

        // //! Checkbox Theme
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(width: 1),
          fillColor: const WidgetStatePropertyAll(ColorManager.transparent),
          checkColor: const WidgetStatePropertyAll(Colors.green),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      );

  static TextStyle _getTFFFontStyle({bool? error}) {
    return error ?? false
        ? StyleManager.getRegularStyle(
            color: ColorManager.red,
            fontSize: FontSize.s13,
          )
        : StyleManager.getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s13,
          );
  }

  static InputBorder _getTFFBorderStyle({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? ColorManager.black,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );
  }

  ///!TextTheme
  static TextTheme _myTextTheme() {
    return TextTheme(
      headlineLarge: StyleManager.getBoldStyle(fontSize: FontSize.s30),
      // headlineMedium: ,
      // headlineSmall: ,

      bodyLarge: StyleManager.getMediumStyle(fontSize: FontSize.s20),
      bodyMedium: StyleManager.getMediumStyle(fontSize: FontSize.s16),
      // bodySmall: ,

      displayLarge: StyleManager.getSemiBoldStyle(
        fontSize: FontSize.s24,
      ),

      // displayMedium: StyleManager.getRegularStyle(
      //   fontSize: FontSize.s21,
      //   color: ColorManager.white,
      // ),

      // displaySmall: StyleManager.getRegularStyle(
      //   fontSize: FontSize.s15,
      //   color: ColorManager.silverGray,
      // ),

      // labelLarge: ,
      // labelMedium: StyleManager.getMediumStyle(
      //   color: ColorManager.charcoalGray,
      //   fontSize: FontSize.s21,
      // ), // For ElevatedButton
      // labelSmall: ,

      // titleLarge: ,
      titleMedium: StyleManager.getMediumStyle(fontSize: FontSize.s22),
      // titleSmall: ,
    );
  }
}
