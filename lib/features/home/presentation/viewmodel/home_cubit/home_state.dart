part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

final class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ExpenseModel> expenses;
  final CalculateModel calculations;
  final List<GroupDataModel> groupData;
  final String selectedCategory;

  HomeLoaded({
    required this.categories,
    required this.expenses,
    required this.calculations,
    required this.groupData,
    required this.selectedCategory,
  });

  HomeLoaded copyWith({
    List<CategoryModel>? categories,
    List<ExpenseModel>? expenses,
    CalculateModel? calculations,
    List<GroupDataModel>? groupData,
    String? selectedCategory,
  }) {
    return HomeLoaded(
      categories: categories ?? this.categories,
      expenses: expenses ?? this.expenses,
      calculations: calculations ?? this.calculations,
      groupData: groupData ?? this.groupData,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
