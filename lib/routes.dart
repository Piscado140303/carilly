import 'package:carilly1/Pages/CampanyFormRegistration.dart';
import 'package:carilly1/Pages/EditProfile.dart';
import 'package:carilly1/Pages/ProfileCampany.dart';
import 'package:carilly1/Pages/RequestPage.dart';
import 'package:carilly1/Pages/SuggestionsPage.dart';
import 'package:carilly1/Pages/addCarForm.dart';
import 'package:carilly1/Pages/carDetails.dart';
import 'package:carilly1/Pages/homeCampany.dart';
import 'package:carilly1/Pages/homeUser.dart';
import 'package:carilly1/Pages/logIn.dart';
import 'package:carilly1/Pages/logInCam.dart';
import 'package:carilly1/Pages/myCars.dart';
import 'package:carilly1/Pages/requestCarForm.dart';
import 'package:carilly1/Pages/searchPage.dart';
import 'package:carilly1/Pages/settings.dart';
import 'package:carilly1/Pages/typeOfUser.dart';
import 'package:carilly1/Pages/userFormRegistration.dart';
import 'package:flutter/material.dart';

import 'Pages/welcomePage.dart';

var routes=<String,WidgetBuilder>{
  '/carDetails':(context)=>const CarDetails(),
  '/typeOfUser':(context)=>TypeOfUser(),
  '/welcomePage':(context)=>const WelcomePage(),
  '/userFormRegistration':(context)=>UserFormRegistration(),
  '/requestPage':(context)=>const RequestPage(),
  '/addCarForm':(context)=>AddCarForm(),
  '/homeUser':(context)=>const HomeUser(),
  '/homeCampany':(context)=>const HomeCampany(),
  '/logInPage':(context)=>const LoginPage(),
  '/Campanyformregistration':(context)=>const Campanyformregistration(),
  '/SegestionsPage':(context)=>const SuggestionsPage(),
  '/SearchPage':(context)=>const SearchPage(),
  '/ProfilePageC':(context)=>const ProfilePageC(),
  '/MyCars':(context)=>const MyCars(),
  '/SettingsPage':(context)=>SettingsPage(),
  '/LoginPageCam':(context)=>const LoginPageCam(),
  '/Editprofile':(context)=>EditProfileScreen(),
};