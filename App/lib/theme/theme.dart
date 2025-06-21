import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'app_colours.dart';
import 'custom_theme_extension.dart';

final ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColours.newThemePrimaryColor,
  // primaryColor: AppColours.newThemePrimaryColor,
  // scaffoldBackgroundColor: AppColours.bgColorGrey,
  scaffoldBackgroundColor: Colors.white,

  //Appbar
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: AppColours.appBarTextColor,
      fontSize: 20,
      fontFamily: "SfDisplaySemibold",
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
        color: AppColours.appBarTextColor,
        size: 16
    ),
  ),

  //BotomNavigationBar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColours.newThemePrimaryColor,
    unselectedItemColor: AppColours.subTextColor,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500
    ),
    unselectedLabelStyle: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500
    ),
    selectedIconTheme: IconThemeData(
        color: AppColours.newThemePrimaryColor,
        size: 50
    ),
    unselectedIconTheme: IconThemeData(
        color: AppColours.subTextColor,
        size: 40
    ),
  ),

  //divider
  dividerTheme: const DividerThemeData(
      color: AppColours.dividerColor,
      thickness: 1,
      space: 1
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.all(const Size(336, 48)),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColours.secondary100Color;
        }
        return AppColours.primaryColor;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColours.secondary100Color;
        }
        return AppColours.baseWhiteColor;
      }),
      overlayColor: WidgetStateProperty.all(AppColours.primaryColor.withOpacity(0.1)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColours.primaryColor),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 14),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: "NunitoSansSemiBold",
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColours.textFeildBorderColor,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    hintStyle: TextStyle( color: AppColours.textFeildBorderColor, fontSize: 16,fontWeight: FontWeight.w400,fontFamily: "NunitoSansRegular"),
    border:  OutlineInputBorder(
      borderSide: BorderSide(color: AppColours.textFeildBorderColor,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide( color: AppColours.textFeildBorderColor,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColours.textFeildBorderColor,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    errorBorder: OutlineInputBorder(
      // borderSide: BorderSide(color: AppColours.errorTextColor, width: 1),
      borderSide: BorderSide(color: AppColours.errorColorPink, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    errorStyle: TextStyle(
      color: AppColours.errorColorPink,
      fontSize: 12,
    ),
    focusedErrorBorder: OutlineInputBorder(
      // borderSide: BorderSide(color: AppColours.errorTextColor, width: 1),
      borderSide: BorderSide(color: AppColours.errorColorPink, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),

  ),

  tabBarTheme: TabBarTheme(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    indicatorColor: Colors.transparent,
    indicator: const BoxDecoration(
      color: AppColours.newThemeServicesSvgBg,
      // color: Colors.grey,
      border: Border(
        bottom: BorderSide(
          color: AppColours.newMagentaThemePrimaryColor,
          // color: Colors.grey,
          width: 3,
        ),
      ),
    ),
    labelColor: AppColours.newMagentaThemePrimaryColor,
    // labelColor: Colors.grey,
    unselectedLabelColor: AppColours.newThemeSecondaryColor,
    // unselectedLabelColor: Colors.grey,
    labelStyle: const TextStyle(
      fontSize: 14,
      fontFamily: "NunitoSansSemiBold",
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontFamily: "NunitoSansSemiBold",
      fontWeight: FontWeight.w700,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
  ),

  // textTheme: TextTheme(
  //   bodyLarge: AppTextStyles.regular,
  //   bodyMedium: AppTextStyles.medium,
  //   titleMedium: AppTextStyles.semiBold,
  //   titleLarge: AppTextStyles.bold,
  // ),


  extensions: [
    CustomThemeExtension(
      //Pinput
        customPinTheme: CustomPinTheme(
            defaultPinTheme: const PinTheme(
              width: 24,
              height: 45,
              textStyle: TextStyle(fontSize: 28, color: AppColours.secondary900Color,
                  fontWeight: FontWeight.w700,fontFamily: "NunitoSansBold"),
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Colors.transparent,
                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
                // border: Border(bottom: BorderSide(color: AppColours.secondary800Color, width: 1)),
              ),
            ),
            focusedPinTheme: const PinTheme(
              width: 24,
              height: 45,
              textStyle: TextStyle(fontSize: 28, color: AppColours.secondary900Color,
                  fontWeight: FontWeight.w700,fontFamily: "NunitoSansBold"),
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Colors.transparent,
                // border: Border(bottom: BorderSide(color: AppColours.newMagentaSubTextColor, width: 1)),
                border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
              ),
            ),
            errorPinTheme: const PinTheme(
              width: 24,
              height: 45,
              textStyle: TextStyle(fontSize: 28, color: AppColours.secondary900Color,
                  fontWeight: FontWeight.w700,fontFamily: "NunitoSansBold"),
              decoration: BoxDecoration(
                color: Colors.transparent,
                // border: Border(bottom: BorderSide(color: AppColours.secondary800Color, width: 1)),
                border: Border(bottom: BorderSide(color: AppColours.newMagentaThemePrimaryColorLight, width: 1)),
              ),
            ),
            pinputLength: 6, showPinputCursor: true,
            pinputSeparator: const SizedBox(width: 20),
            pinputErrorTextStyle: const TextStyle(color: Colors.red),
            pinputCursor:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 2,
                  height: 20,
                  color: AppColours.secondary900Color,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColours.secondary900Color,
                  ),
                ),
              ],
            )
        ),
        //GradientProgressBar
        gradientProgressLoaderCustomTheme: GradientProgressLoaderCustomTheme(
            loaderRadius: 40,
            gradientLoaderColors: const [
              AppColours.newThemePrimaryColor,
              AppColours.newThemePrimaryColor,
            ], strokeWidth: 8
        ),
        //snackbarsuccess
        toastSuccessColor: Colors.green,
        //snackbarerror
        toastErrorColor: Colors.red,

        sendInviteContainerBgColor: AppColours.newThemeServicesSvgBg,

        //homeiconcolor
        homeServicesSvgIcon: AppColours.newThemePrimaryColor,

        homeServicesSvgBg: AppColours.newThemeServicesSvgBg,
        //home transaction
        homeTransitionSvgIcon: AppColours.newThemePrimaryColor,
        //qr download
        downloadSvgIcon: AppColours.newThemePrimaryColor,
        //leveltwo icon
        levelTwoSvgIcon: AppColours.newThemePrimaryColor,
        //buttom theme
        customButtonTheme: CustomButtonTheme(
            enableButtonColor: AppColours.newThemePrimaryColor,
            disableButtonColor: AppColours.forwardArrowColor,
            enableBtnTextColor: AppColours.textColor,
            disableBtnTextColor: AppColours.disableButtonTextColor,
            enableBtnBorderColor: AppColours.newThemePrimaryColor,
            disableBtnBorderColor: AppColours.disableButtonTextColor,
            circularProgressIndicatorColor: AppColours.newThemePrimaryColor
        ),

        customLinearGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColours.newThemePrimaryColor,
            // AppColours.newThemeSecondaryColor,
            AppColours.newThemeSecondaryColor2,
          ],
          stops: [0.0, 0.3],
        ),

        customLinearGradientHalfScreen: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColours.newThemePrimaryColor,
            AppColours.newThemeSecondaryColor2,
            // AppColours.newThemeSecondaryColor.withOpacity(0.1),
          ],
          stops: [0.2, 1.0],
        ),

        customLinearGradientFullScreen: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColours.newThemePrimaryColor,
            // AppColours.newThemeSecondaryColor,
            // AppColours.gradi2,
            AppColours.gradi3,
          ],
          stops: [0.0, 0.9], // Adjusted stops for smoother transition
          // stops: [0.0, 0.8, 0.9], // Adjusted stops for smoother transition
        ),

        // LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     AppColours.newThemePrimaryColor,
        //     AppColours.newThemeSecondaryColor,
        //   ],
        //   // stops: [0.4, 0.6],
        // ),

        downloadBtnDecoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColours.newThemePrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),

        shareBtnDecoration: BoxDecoration(
          color: AppColours.newThemePrimaryColor,
          border: Border.all(color: AppColours.newThemePrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),

        qrCodeDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColours.newThemePrimaryColor)
        ),

        circularBgForUserInitial: const BoxDecoration(
          color: AppColours.initialUserBgColor,
          shape: BoxShape.circle,
        ),

        customLoading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    // child: LoadingIndicator(
                    //   indicatorType: Indicator.circleStrokeSpin,
                    //   colors: [
                    //     AppColours.newThemePrimaryColor
                    //   ],
                    // ),
                  )
              ),
            )
        ),

        appColorTheme: AppColorTheme(
            textPrimaryColor: AppColours.newMagentaThemePrimaryColor,
            textSecondaryColor: AppColours.newMagentaHomeScreenTextColor,
            textTitleColor: AppColours.newMagentaTextHeaderColor,
            textSubTitleColor: AppColours.newMagentaSubTextColor,
            textHintColor: AppColours.newMagentaSubTextColor2,
            textNeutralColor: AppColours.newMagentaTextColor,
            textSuccessColor: AppColours.newMagentaSuccessfulTextColor,
            textFailureColor: AppColours.newMagentaErrorTextColor,
            textBackgroundColor: AppColours.newMagentaLoginHeaderTextColor,
            textBlackColor: AppColours.newMagentaBlackColor,
            iconWarningColor: AppColours.newMagentaWarningColor,
            textSubtitleLightColor: AppColours.newMagentaSubTextColor3
        )



    )
  ],
);
