import 'package:flutter/material.dart';

class Locals {
  Locals(this.locale);

  final Locale locale;

  static Locals of(BuildContext context) {
    return Localizations.of<Locals>(context, Locals)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'Home': 'Home',
      'MyAccount': 'My Account',
      'AccountDetails': 'Account Details',
      'Info': 'Info',
      'EditPhotoTapped': 'Edit photo tapped.',
      'OK': 'OK',
      'ChangePassword': 'Change Password',
      'Bookmarks': 'Bookmarks',
      'LogOut': 'Log Out',
      'CurrentPassword': 'Current Password',
      'NewPassword': 'New Password',
      'ConfirmNewPassword': 'Confirm New Password',
      'Save': 'Save',
      'FullName': 'Full Name',
      'About': 'About',
      'Email': 'Email',
      'WelcomeLogIn': 'Welcome Back, Log In!',
      'Username': 'Username',
      'Password': 'Password',
      'RememberMe': 'Remember Me',
      'ForgotPassword': 'Forgot password?',
      'DontHaveAccount': 'Don\'t have an coount? ',
      'SignUp': 'Sign Up',
      'LogIn': 'Log In',
      'HelloSignUp': 'Hello, Sign Up!',
      'ConfirmPassword': 'Confirm Password',
      'ByClickingSignUp': 'By clicking Sign Up you are in agreement of the',
      'TermsConditions': ' Terms and Conditions.',
      'AlreadyHaveAccount': 'Already have an account? ',
      'ResetMyPassword': 'Reset My Password',
      'PleaseTypeYourEmail':
          'Please type your email then tap the Submit button. We will send an email to reset your password.',
      'Submit': 'Submit',
      'AppName': 'Zeymur Blog',
      'EnterSearchTerm': 'Enter search term',
      'NoItems': 'No items to display.',
      'SortBy': 'Sort by',
      'Cancel': 'Cancel',
      'Comments': 'Comments',
      'MyComments': 'My Comments',
      'ShowComments': 'Show Comments',
      'RelatedPosts': 'Related Posts',
      'RecentComment': 'Recent Comment',
      'SubmitMyComment': 'Submit My Comment',
      'YourComment': 'Your Comment',
      'ShareTapped': 'Share tapped.',
      'Search': 'Search',
      'Keyword': 'Keyword',
      'RecentKeywords': 'Recent Keywords',
      'Posts': 'Posts',
      'PostDetail': 'Post Detail',
      'Default': 'Default',
      'NewToOld': 'New to Old',
      'OldToNew': 'Old to New',
      'MostCommented': 'Most Commented',
      'MostBookmarked': 'Most Bookmarked',
      'Loading': 'Loading...',
    },
    /* 
    To add more language support
    'es': {
      'title': 'Hola Mundo',
    },
    */
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }

  String get home {
    return _localizedValues[locale.languageCode]!['Home']!;
  }

  String get myAccount {
    return _localizedValues[locale.languageCode]!['MyAccount']!;
  }

  String get accountDetails {
    return _localizedValues[locale.languageCode]!['AccountDetails']!;
  }

  String get info {
    return _localizedValues[locale.languageCode]!['Info']!;
  }

  String get editPhotoTapped {
    return _localizedValues[locale.languageCode]!['EditPhotoTapped']!;
  }

  String get oK {
    return _localizedValues[locale.languageCode]!['OK']!;
  }

  String get changePassword {
    return _localizedValues[locale.languageCode]!['ChangePassword']!;
  }

  String get bookmarks {
    return _localizedValues[locale.languageCode]!['Bookmarks']!;
  }

  String get logOut {
    return _localizedValues[locale.languageCode]!['LogOut']!;
  }

  String get currentPassword {
    return _localizedValues[locale.languageCode]!['CurrentPassword']!;
  }

  String get newPassword {
    return _localizedValues[locale.languageCode]!['NewPassword']!;
  }

  String get confirmNewPassword {
    return _localizedValues[locale.languageCode]!['ConfirmNewPassword']!;
  }

  String get save {
    return _localizedValues[locale.languageCode]!['Save']!;
  }

  String get fullName {
    return _localizedValues[locale.languageCode]!['FullName']!;
  }

  String get about {
    return _localizedValues[locale.languageCode]!['About']!;
  }

  String get email {
    return _localizedValues[locale.languageCode]!['Email']!;
  }

  String get welcomeLogIn {
    return _localizedValues[locale.languageCode]!['WelcomeLogIn']!;
  }

  String get username {
    return _localizedValues[locale.languageCode]!['Username']!;
  }

  String get password {
    return _localizedValues[locale.languageCode]!['Password']!;
  }

  String get rememberMe {
    return _localizedValues[locale.languageCode]!['RememberMe']!;
  }

  String get forgotPassword {
    return _localizedValues[locale.languageCode]!['ForgotPassword']!;
  }

  String get dontHaveAccount {
    return _localizedValues[locale.languageCode]!['DontHaveAccount']!;
  }

  String get signUp {
    return _localizedValues[locale.languageCode]!['SignUp']!;
  }

  String get logIn {
    return _localizedValues[locale.languageCode]!['LogIn']!;
  }

  String get helloSignUp {
    return _localizedValues[locale.languageCode]!['HelloSignUp']!;
  }

  String get confirmPassword {
    return _localizedValues[locale.languageCode]!['ConfirmPassword']!;
  }

  String get byClickingSignUp {
    return _localizedValues[locale.languageCode]!['ByClickingSignUp']!;
  }

  String get termsConditions {
    return _localizedValues[locale.languageCode]!['TermsConditions']!;
  }

  String get alreadyHaveAccount {
    return _localizedValues[locale.languageCode]!['AlreadyHaveAccount']!;
  }

  String get resetMyPassword {
    return _localizedValues[locale.languageCode]!['ResetMyPassword']!;
  }

  String get pleaseTypeYourEmail {
    return _localizedValues[locale.languageCode]!['PleaseTypeYourEmail']!;
  }

  String get submit {
    return _localizedValues[locale.languageCode]!['Submit']!;
  }

  String get appName {
    return _localizedValues[locale.languageCode]!['AppName']!;
  }

  String get enterSearchTerm {
    return _localizedValues[locale.languageCode]!['EnterSearchTerm']!;
  }

  String get noItems {
    return _localizedValues[locale.languageCode]!['NoItems']!;
  }

  String get sortBy {
    return _localizedValues[locale.languageCode]!['SortBy']!;
  }

  String get cancel {
    return _localizedValues[locale.languageCode]!['Cancel']!;
  }

  String get comments {
    return _localizedValues[locale.languageCode]!['Comments']!;
  }

  String get myComments {
    return _localizedValues[locale.languageCode]!['MyComments']!;
  }

  String get showComments {
    return _localizedValues[locale.languageCode]!['ShowComments']!;
  }

  String get relatedPosts {
    return _localizedValues[locale.languageCode]!['RelatedPosts']!;
  }

  String get recentComment {
    return _localizedValues[locale.languageCode]!['RecentComment']!;
  }

  String get submitMyComment {
    return _localizedValues[locale.languageCode]!['SubmitMyComment']!;
  }

  String get yourComment {
    return _localizedValues[locale.languageCode]!['YourComment']!;
  }

  String get shareTapped {
    return _localizedValues[locale.languageCode]!['ShareTapped']!;
  }

  String get search {
    return _localizedValues[locale.languageCode]!['Search']!;
  }

  String get keyword {
    return _localizedValues[locale.languageCode]!['Keyword']!;
  }

  String get recentKeywords {
    return _localizedValues[locale.languageCode]!['RecentKeywords']!;
  }

  String get posts {
    return _localizedValues[locale.languageCode]!['Posts']!;
  }

  String get postDetail {
    return _localizedValues[locale.languageCode]!['PostDetail']!;
  }

  String get default_ {
    return _localizedValues[locale.languageCode]!['Default']!;
  }

  String get newToOld {
    return _localizedValues[locale.languageCode]!['NewToOld']!;
  }

  String get oldToNew {
    return _localizedValues[locale.languageCode]!['OldToNew']!;
  }

  String get mostCommented {
    return _localizedValues[locale.languageCode]!['MostCommented']!;
  }

  String get mostBookmarked {
    return _localizedValues[locale.languageCode]!['MostBookmarked']!;
  }

  String get loading {
    return _localizedValues[locale.languageCode]!['Loading']!;
  }
}
