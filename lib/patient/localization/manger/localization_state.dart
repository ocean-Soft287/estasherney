// part of 'localization_cubit.dart';  // Remove this if you are not using part files

sealed class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class ChangeLanguage extends LocalizationState {
  final String languageCode;

  ChangeLanguage({required this.languageCode});
}
