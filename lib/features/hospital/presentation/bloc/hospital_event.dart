part of "hospital_bloc.dart";

abstract class HospitalEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHospitalsEvent extends HospitalEvent {
  GetHospitalsEvent();
}

class GetHospitalEvent extends HospitalEvent {
  final String hospitalId;

  GetHospitalEvent({required this.hospitalId});

  @override
  List<Object?> get props => [hospitalId];
}

class SearchHospitalEvent extends HospitalEvent {
  final String query;

  SearchHospitalEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
