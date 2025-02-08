import 'package:bloc/bloc.dart';
// Define Events
abstract class CompanyProfileEvent {}

class NavigateToCompanyProfile extends CompanyProfileEvent {}

// Define States
abstract class CompanyProfileState {}

class CompanyProfileInitial extends CompanyProfileState {}

class CompanyProfileLoaded extends CompanyProfileState {
  final Map<String, String> profileData;
  CompanyProfileLoaded(this.profileData);
}

class CompanyProfileBloc extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  CompanyProfileBloc() : super(CompanyProfileInitial());

  @override
  Stream<CompanyProfileState> mapEventToState(CompanyProfileEvent event) async* {
    if (event is NavigateToCompanyProfile) {
      // Here you would fetch data if needed or just pass data
      Map<String, String> companyProfileData = {
        "Imgpath": "lib/images/company_profile.jpg",
        "Name": "Car Rentals Co.",
        "wilaya": "Algiers"
      };
      // Using emit instead of yield
      emit(CompanyProfileLoaded(companyProfileData));
    }
  }
}
