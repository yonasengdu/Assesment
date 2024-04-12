part of "hospital_bloc.dart";

abstract class HospitalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HospitalInitialState extends HospitalState {}

class HospitalLoadingState extends HospitalState {}

class HospitalSuccessState extends HospitalState {
  final HospitalEntity hospitalEntity;

  HospitalSuccessState({required this.hospitalEntity});

  @override
  List<Object?> get props => [hospitalEntity];
}

class HospitalsSuccessState extends HospitalState {
  final List<HospitalEntity> hospitals;

  HospitalsSuccessState({required this.hospitals});

  @override
  List<Object?> get props => [hospitals];
}

class SearchHospitalLoadingState extends HospitalState {}

class SearchHospitalSuccessState extends HospitalState {
  final List<HospitalEntity> hospitals;

  SearchHospitalSuccessState({required this.hospitals});

  @override
  List<Object?> get props => [hospitals];
}

class NoHospitalFoundState extends HospitalState {
  final String message;

  NoHospitalFoundState({required this.message});

  @override
  List<String> get props => [message];
}

class HospitalFailureState extends HospitalState {
  final String message;

  HospitalFailureState({required this.message});

  @override
  List<String> get props => [message];
}
