import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/services/firestore_service.dart';
import 'package:expense_tracker/core/utils/app_bloc_observer.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo_imple.dart';
import 'package:expense_tracker/features/home/data/repos/home_repo.dart';
import 'package:expense_tracker/features/home/data/repos/home_repo_impl.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
Future<void> setupLocator() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(getIt<FirebaseFirestore>()),
  );
  getIt.registerSingleton<AddExpenseRepo>(
    AddExpenseRepoImple(firestoreServices: getIt<FirestoreService>()),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(firestoreService: getIt<FirestoreService>()),
  );
}
