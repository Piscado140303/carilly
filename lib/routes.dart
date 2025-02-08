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
  '/carDetails':(context)=>CarDetails(),
  '/typeOfUser':(context)=>TypeOfUser(),
  '/welcomePage':(context)=>WelcomePage(),
  '/userFormRegistration':(context)=>UserFormRegistration(),
  '/requestPage':(context)=>RequestPage(),
  '/addCarForm':(context)=>AddCarForm(),
  '/homeUser':(context)=>HomeUser(),
  '/homeCampany':(context)=>HomeCampany(),
  '/logInPage':(context)=>LoginPage(),
  '/Campanyformregistration':(context)=>Campanyformregistration(),
  '/SegestionsPage':(context)=>SuggestionsPage(),
  '/SearchPage':(context)=>SearchPage(),
  '/ProfilePageC':(context)=>ProfilePageC(),
  '/MyCars':(context)=>MyCars(),
  '/SettingsPage':(context)=>SettingsPage(),
  '/LoginPageCam':(context)=>LoginPageCam(),
  '/Editprofile':(context)=>EditProfileScreen(),
};