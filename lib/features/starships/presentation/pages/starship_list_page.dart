import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/starship_bloc.dart';
import '../widgets/starship_controls.dart';
import '../widgets/widgets.dart';

class StarshipListPage extends StatelessWidget {
  const StarshipListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spaceships"),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<StarshipBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => get<StarshipBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              BlocBuilder<StarshipBloc, StarshipState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return const MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return const LoadingWidget();
                  } else if (state is Loaded) {
                    return StarshipDisplay(starship: state.starship);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.errorMessage,
                    );
                  }
                  return const LoadingWidget();
                },
              ),
              const SizedBox(height: 20),
              // Bottom half
              const StarshipControls(),
            ],
          ),
        ),
      ),
    );
  }
}
