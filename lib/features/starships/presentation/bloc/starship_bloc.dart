import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../common/util/input_converter.dart';
import '../../domain/entities/starship.dart';
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
  final InputConverter inputConverter;

  StarshipBloc(
      {required this.getStarshipByName,
      required this.getRandomStarship,
      required this.inputConverter})
      : super(Empty()) {
    on<GetNameForStarship>(_onGetNameForStarshipEvent);
  }

  StarshipState get initialState => Empty();

  _onGetNameForStarshipEvent(
      GetNameForStarship event, Emitter<StarshipState> emit) {
    final inputEither = inputConverter.stringToUnsignedInt(event.numberString);

    inputEither.fold(
      (failure) => emit(const Error(errorMessage: invalidInputFailure)),
      (value) => emit(Empty()),
    );
  }
}