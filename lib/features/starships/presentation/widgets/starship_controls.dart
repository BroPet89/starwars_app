import '../bloc/starship_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarshipControls extends StatefulWidget {
  const StarshipControls({
    Key? key,
  }) : super(key: key);

  @override
  StarshipControlsState createState() => StarshipControlsState();
}

class StarshipControlsState extends State<StarshipControls> {
  final controller = TextEditingController();
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child:  ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.secondary)
                ),
                onPressed: dispatchConcrete,
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child:  ElevatedButton(
                onPressed: dispatchRandom,
                child: const Text('Get random trivia'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<StarshipBloc>(context)
        .add(GetNameForStarship(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<StarshipBloc>(context).add(GetRandomForStarship());
  }
}