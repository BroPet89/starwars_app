import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:starwars_app/common/error/failures.dart';
import '../../../../common/util/input_trimmer.dart';

import '../../../../common/util/input_converter.dart';
import '../../domain/entities/starship.dart';
import '../../domain/use_cases/get_list_starship.dart';
import '../../domain/use_cases/get_random_starship.dart';
import '../../domain/use_cases/get_starship_by_name.dart';

part 'starship_event.dart';
part 'starship_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailure =
    'Invalid Input - The number must be a positive integer or zero.';

class StarshipBloc extends Bloc<StarshipEvent, StarshipState> {
  final GetStarshipByName getStarshipByName;
  final GetRandomStarship getRandomStarship;
  final GetListStarship getListStarship;
  final InputTrimmer inputTrimmer;

  StarshipBloc(
      {required this.getStarshipByName,
      required this.getRandomStarship,
      required this.getListStarship,
      required this.inputTrimmer})
      : super(Empty()) {
    on<GetNameForStarship>(_onGetNameForStarshipEvent);
  }

  _onGetNameForStarshipEvent(
      GetNameForStarship event, Emitter<StarshipState> emit) {
    final inputEither = inputTrimmer.trimWhiteSpace(event.searchTerm);

    inputEither
        .fold((failure) => emit(const Error(errorMessage: invalidInputFailure)),
            (value) async {
      emit(Loading());
      final failureOrStarship =
          await getStarshipByName(Params(searchTerm: value));
      failureOrStarship.fold(
          (failure) => Error(
              errorMessage: failure is ServerFailure
                  ? serverFailureMessage
                  : cacheFailureMessage),
          (starship) => Loaded(starship: starship));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
