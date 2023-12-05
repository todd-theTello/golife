part of 'themes.dart';

/// sets the light theme data of the app
final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff1f7a8c),
    primaryContainer: Color(0xff004953),
    secondary: Color(0xff032b43),
    secondaryContainer: Color(0xff3f88c5),
    tertiary: Color(0xff006875),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xff3f88c5),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 2,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    splashType: FlexSplashType.noSplash,
    defaultRadius: 8,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    outlinedButtonPressedBorderWidth: 2,
    toggleButtonsBorderSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorIsFilled: false,
    inputDecoratorBackgroundAlpha: 21,
    inputDecoratorRadius: 8,
    inputDecoratorUnfocusedBorderIsColored: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    popupMenuRadius: 6,
    popupMenuElevation: 8,
    useInputDecoratorThemeInDialogs: true,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6,
    menuElevation: 8,
    menuBarRadius: 0,
    menuBarElevation: 1,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1,
    buttonPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    buttonMinSize: Size(64, 48),
  ),
  keyColors: const FlexKeyColors(
    keepPrimary: true,
    keepSecondaryContainer: true,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: VisualDensity.compact,
  useMaterial3: true,
  fontFamily: 'Gilroy',
);
