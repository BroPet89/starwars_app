import 'package:flutter/material.dart';

class FontFamilies {
  static String get filsonPro => "Filson Pro";
  static String get roboto => "Roboto";
  static String get body => roboto;
  static String get subtitle => roboto;
  static String get title => roboto;
}
 
class FontSizes {
  static double get body => 14;
  static double get bodySm => 12;
  static double get subtitle => 20;
  static double get title => 25;
  static double get sidebarItem => 15;
  static double get pageTitle => 23;
  static double get tableHeader => 16;
  static double get textField => 15;
  static double get largeMessage => 38;
  static double get jobStatsCard => 20;
  static double get jobStatsCardNumber => 30;

  static double get jobCreationStageListItem => 20;
  static double get jobCreationProgressBarItem => 20;
  static double get candidateName => 18;
  static double get progressBarItem => 20;
  static double get interviewTipTitle => 28;
  static double get interviewTipText => 22;
  static double get questionLabel => 20;
  static double get candidateTitle => 20;
}
 
class TextStyles {
  static TextStyle get title => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.title);
  static TextStyle get subtitle => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.subtitle);
  static TextStyle get body => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.body, fontWeight: FontWeight.w400);
  static TextStyle get sidebarItem => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.sidebarItem, fontWeight: FontWeight.w600);
  static TextStyle get pageTitle => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.pageTitle);
  static TextStyle get tableHeader => TextStyle(fontFamily: FontFamilies.roboto, fontSize: FontSizes.tableHeader, fontWeight: FontWeight.bold);
  static TextStyle get formFieldAddon => TextStyle(fontWeight: FontWeight.w400);
  static TextStyle get largeMessage => TextStyle(fontWeight: FontWeight.w500, fontSize: FontSizes.largeMessage);
  static TextStyle get jobStatsCard => TextStyle(fontSize: FontSizes.jobStatsCard);
  static TextStyle get jobStatsCardNumber => TextStyle(fontSize: FontSizes.jobStatsCardNumber);

  static TextStyle get jobCreationStageListItem => TextStyle(fontSize: FontSizes.jobCreationStageListItem, fontWeight: FontWeight.bold);
  static TextStyle get jobCreationProgressBarItem => TextStyle(fontSize: FontSizes.jobCreationProgressBarItem);
  static TextStyle get jobCreationProgressBarCurrentItem => TextStyle(fontSize: FontSizes.jobCreationProgressBarItem, fontWeight: FontWeight.bold);
  static TextStyle get candidateName => TextStyle(fontSize: FontSizes.candidateName, fontWeight: FontWeight.bold);
  static TextStyle get progressBarItem => TextStyle(fontSize: FontSizes.progressBarItem);
  static TextStyle get interviewTipTitle => TextStyle(fontSize: FontSizes.interviewTipTitle, fontWeight: FontWeight.bold);
  static TextStyle get interviewTipText => TextStyle(fontSize: FontSizes.interviewTipText);
  static TextStyle get questionLabel => TextStyle(fontSize: FontSizes.questionLabel);
  static TextStyle get candidateTitle => TextStyle(fontSize: FontSizes.candidateTitle);
}
extension ExtendedTextStyle on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get emboldened => copyWith(
    fontWeight: FontWeight.bold,
    shadows: [
      const Shadow(
          color: Colors.black,
          offset: Offset(0, -5))
    ],
    color: Colors.transparent
  );
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle colour(Color color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle weight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle height(double height) => copyWith(height: height);
}