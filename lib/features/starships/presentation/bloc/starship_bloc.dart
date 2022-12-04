import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'starship_event.dart';
part 'starship_state.dart';

class StarshipBloc extends Bloc<StarshipEvent, StarshipState> {
  StarshipBloc() : super(StarshipInitial()) {
    on<StarshipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
