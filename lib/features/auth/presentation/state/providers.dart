import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starwars_app/src/data/current_user_provider.dart';
import 'package:starwars_app/src/data/repositories/user_repository.dart';
import 'package:starwars_app/src/utils/network_info.dart';
import 'package:starwars_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:starwars_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:starwars_app/features/auth/data/repositories/auth_repository.dart';
import 'package:starwars_app/features/auth/presentation/state/auth_notifier.dart';
import 'package:starwars_app/features/auth/presentation/state/auth_state.dart';
import 'package:riverpod/riverpod.dart';

final userProvider = Provider<UserProvider>((ref) => CurrentUserProvider());
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>((ref) => FirebaseAuthDatasource(
          ref.watch(firebaseAuthProvider),
          ref.watch(firebaseFirestoreProvider),
          ref.watch(userProvider),
        ));
final authLocalDataSourceProvider =
    Provider<AuthLocalDataSource>((ref) => SharedPrefsAuthDataSource());
final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => ConnectivityNetworkInfo(
    Connectivity(),
  ),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  ),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => FirebaseUserRepository(
    ref.watch(networkInfoProvider),
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(userProvider),
    ref.watch(authRepositoryProvider),
    ref.watch(userRepositoryProvider),
  ),
);