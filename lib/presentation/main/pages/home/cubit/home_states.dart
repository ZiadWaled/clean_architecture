
// Define your states here
import 'package:clean_architecture/domain/model/models.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeBannersDataSuccess extends HomeStates {
  final List<Banners> banners;

  HomeBannersDataSuccess({required this.banners});
}

class HomeStoresDataSuccess extends HomeStates {
  final List<Stores> stores;

  HomeStoresDataSuccess({required this.stores});
}

class HomeServicesDataSuccess extends HomeStates {
  final List<Service> services;

  HomeServicesDataSuccess({required this.services});
}

class HomeDataFailure extends HomeStates {
  final String error;

  HomeDataFailure(this.error);
}

class HomeDataEmpty extends HomeStates {}
