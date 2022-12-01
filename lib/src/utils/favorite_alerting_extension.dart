import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_app/src/providers/providers.dart';
import 'package:starwars_app/src/ui/messages/flashbar_messages.dart';
import 'package:starwars_app/features/favorite/presentation/state/favorite_state.dart';

extension FavoriteAlertingExtension on WidgetRef {
  void favoriteStateListener(BuildContext context) {
    listen<FavoriteState>(
      favoriteNotifierProvider,
      (_, state) {
        state.maybeMap(
            orElse: () {},
            data: (state) {
              if (!state.favorite) {
                FlashbarMessages.showFlashbarMessage(context,
                    message: 'Removed from favorites');
              } else {
                FlashbarMessages.showFlashbarMessage(context,
                    message: 'Added to favorites');
              }
            },
            error: (_) {
              FlashbarMessages.showErrorMessage(context,
                  message: 'Something wrong happened');
            });
      },
    );
  }
}