import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_architecture/app/di.dart';
import 'package:clean_architecture/domain/model/models.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/presentation/main/pages/home/cubit/home_cubit.dart';
import 'package:clean_architecture/presentation/main/pages/home/cubit/home_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load banners data when the widget is initialized
    // context.read<HomeCubit>().getBannersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(instance()),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeBannersDataSuccess) {
              return _getContentWidgets(state.banners);
            } else if (state is HomeDataFailure) {
              return _buildError(state.error);
            } else if (state is HomeDataEmpty) {
              return _buildEmpty();
            } else {
              return _buildLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _getContentWidgets(List<Banners>? banners) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBanner(banners),
        // Uncomment and update these lines based on your requirements
        // _getSection(AppStrings.services),
        // _getServicesWidget(services),
        // _getSection(AppStrings.stores),
        // _getStoresWidget(stores),
      ],
    );
  }

  Widget _getBanner(List<Banners>? banners) {
    if (banners != null && banners.isNotEmpty) {
      return CarouselSlider(
        items: banners.map((banner) {
          return SizedBox(
            width: double.infinity,
            child: Card(
              elevation: AppSize.s1_5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
                side: BorderSide(
                  color: ColorManager.primary,
                  width: AppSize.s1_5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12),
                child: Image.network(
                  banner.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: AppSize.s100,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(
        'Error: $error',
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        'No Data Available',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
