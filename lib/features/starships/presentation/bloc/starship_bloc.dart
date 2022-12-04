import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:starwars_app/features/starships/domain/entities/starship.dart';

part 'starship_event.dart';
part 'starship_state.dart';

class StarshipBloc extends Bloc<StarshipEvent, StarshipState> {
  StarshipBloc() : super(Empty()) {
    on<StarshipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
