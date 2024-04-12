import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/domain/usecase/get_hospital_usecase.dart';
import 'package:assesment/features/hospital/domain/usecase/get_hospitals_usecase.dart';
import 'package:assesment/features/hospital/domain/usecase/search_hospital_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "hospital_event.dart";
part "hospital_state.dart";

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc({
    required GetHospitalUseCase getHospitalUseCase,
    required GetHospitalsUseCase getHospitalsUseCase,
    required SearchHospitalUseCase searchHospitalUseCase,
  })  : _getHospitalUseCase = getHospitalUseCase,
        _getHospitalsUseCase = getHospitalsUseCase,
        _searchHospitalUseCase = searchHospitalUseCase,
        super(HospitalInitialState()) {
    on<GetHospitalsEvent>(_getHospitalsHandler);
    on<GetHospitalEvent>(_getHospitalHandler);
    on<SearchHospitalEvent>(_searchHospitalHandler);
  }

  final GetHospitalUseCase _getHospitalUseCase;
  final GetHospitalsUseCase _getHospitalsUseCase;
  final SearchHospitalUseCase _searchHospitalUseCase;

  Future<void> _getHospitalsHandler(
    GetHospitalsEvent event,
    Emitter<HospitalState> emit,
  ) async {
    emit(HospitalLoadingState());
    final result = await _getHospitalsUseCase.call();
    result.fold(
      (error) => emit(
        HospitalFailureState(message: "Unable to get Hospitals😒😒"),
      ),
      (hospitals) => emit(HospitalsSuccessState(hospitals: hospitals)),
    );
  }

  Future<void> _getHospitalHandler(
    GetHospitalEvent event,
    Emitter<HospitalState> emit,
  ) async {
    emit(HospitalLoadingState());
    final result = await _getHospitalUseCase.call(event.hospitalId);
    result.fold(
        (error) => emit(
              HospitalFailureState(message: "Unable to get your Hospital😒😒"),
            ),
        (hospital) => emit(HospitalSuccessState(hospitalEntity: hospital)));
  }

  Future<void> _searchHospitalHandler(
    SearchHospitalEvent event,
    Emitter<HospitalState> emit,
  ) async {
    emit(SearchHospitalLoadingState());
    final result = await _searchHospitalUseCase.call(event.query);
    result.fold(
        (error) => emit(
              HospitalFailureState(message: "Unable to get your Hospital😒😒"),
            ), (hospitals) {
      if (hospitals.isEmpty) {
        emit(
          NoHospitalFoundState(
              message: "No Hospital found with this ${event.query}"),
        );
      } else {
        emit(
          SearchHospitalSuccessState(hospitals: hospitals),
        );
      }
    });
  }
}
