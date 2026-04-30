import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Features - Auth
import 'package:fit_flow/featuers/auth/data/services/firebase_auth_service.dart';
import 'package:fit_flow/featuers/auth/data/repo/auth_repo.dart';
import 'package:fit_flow/featuers/auth/ui/cubit/auth_cubit_cubit.dart';

// Features - Onboarding
import 'package:fit_flow/featuers/onboarding/data/services/firestore_plans_service.dart';
import 'package:fit_flow/featuers/onboarding/data/repo/plans_repo.dart';
import 'package:fit_flow/featuers/onboarding/ui/logic/plans_cubit.dart';

final getIt = GetIt.instance;

/// Initialize all dependencies for the application
Future<void>setupDependencies () async {
  // ==================== External Packages ====================
  
  // Firebase
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // ==================== Services ====================
  
  // Auth Service
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(getIt<FirebaseAuth>()),
  );

  // Plans Service
  getIt.registerSingleton<FirestorePlansService>(
    FirestorePlansService(getIt<FirebaseFirestore>()),
  );

  // ==================== Repositories ====================
  
  // Auth Repository
  getIt.registerSingleton<AuthRepo>(
    FirebaseAuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  // Plans Repository
  getIt.registerSingleton<PlansRepo>(
    FirestorePlansRepoImpl(
      firestorePlansService: getIt<FirestorePlansService>(),
    ),
  );

  // ==================== Cubits ====================

  // Auth Cubit
  getIt.registerLazySingleton<AuthCubitCubit>(
    () => AuthCubitCubit(authRepo: getIt<AuthRepo>()),
  );

  // Plans Cubit
  getIt.registerLazySingleton<PlansCubit>(
    () => PlansCubit(plansRepo: getIt<PlansRepo>()),
  );

  // ==================== Use Cases / etc ====================
  // Add your use cases and other dependencies here as needed
  
}

/// Get an instance of a dependency
/// Usage: getIt<AuthRepo>() to get a service
/// Usage: await sl() to initialize all dependencies
