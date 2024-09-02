import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/domain/usecase/home_usecase.dart';
import 'package:clean_architecture/presentation/main/pages/home/cubit/home_states.dart';
import 'package:dartz/dartz.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeUseCase homeUseCase;
  List<Banners> banners = [];
  List<Stores> stores = [];
  List<Service> services = [];


  HomeCubit(this.homeUseCase) : super(HomeInitial());

getBannersData() async {

      print('Executing homeUseCase...');
      final Either<Failure, HomeObject> result = await homeUseCase.execute(null);

      result.fold(
            (failure) {
          print('Failure: ${failure.message}');
          emit(HomeDataFailure('Failed to load data: ${failure.message}'));
        },
            (homeObject) {
          if (homeObject.data != null) {
            banners = homeObject.data!.banners;
            print('Banners loaded: ${banners.length}');
            emit(HomeBannersDataSuccess(banners: banners));
          } else {
            print('No data found in homeObject.');

          }
        },
      );

  }


  Future<void> getStoresData() async {
    try {
      final Either<Failure, HomeObject> result = await homeUseCase.execute(null);

      result.fold(
            (failure) {
          emit(HomeDataFailure('Failed to load data: ${failure.message}'));
        },
            (homeObject) {
          if (homeObject.data != null && homeObject.data!.stores.isNotEmpty) {
            stores = homeObject.data!.stores;
            emit(HomeStoresDataSuccess(stores: stores));
          } else {
            emit(HomeDataEmpty());
          }
        },
      );
    } catch (error) {
      emit(HomeDataFailure('Error: $error'));
    }
  }

  Future<void> getServicesData() async {
    try {
      final Either<Failure, HomeObject> result = await homeUseCase.execute(null);

      result.fold(
            (failure) {
          emit(HomeDataFailure('Failed to load data: ${failure.message}'));
        },
            (homeObject) {
          if (homeObject.data != null && homeObject.data!.services.isNotEmpty) {
            services = homeObject.data!.services;
            emit(HomeServicesDataSuccess(services: services));
          } else {
            emit(HomeDataEmpty());
          }
        },
      );
    } catch (error) {
      emit(HomeDataFailure('Error: $error'));
    }
  }
}