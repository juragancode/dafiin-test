import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_ordering/cache/local_store.dart';
import 'package:food_app_ordering/fake_restaurant_api.dart';
import 'package:food_app_ordering/states_management/auth/auth_cubit.dart';
import 'package:food_app_ordering/states_management/helpers/header_cubit.dart';
import 'package:food_app_ordering/states_management/restaurant/restaurant_cubit.dart';
import 'package:food_app_ordering/ui/pages/auth/auth_page.dart';
import 'package:food_app_ordering/ui/pages/home/home_page_adapter.dart';
import 'package:food_app_ordering/ui/pages/home/restaurant_list_page.dart';
import 'package:food_app_ordering/ui/pages/restaurant/restaurant_page.dart';
import 'package:food_app_ordering/ui/pages/search_results/search_results_page.dart';
import 'package:food_app_ordering/ui/pages/search_results/search_results_page_adapter.dart';
import 'package:http/http.dart';
import 'package:restaurant/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache/local_store_contract.dart';

class CompositionRoot {
  static SharedPreferences _sharedPreferences;
  static ILocalStore _localStore;
  static String _baseUrl;
  static Client _client;
  static FakeRestaurantApi _api;

  static configure() {
    _localStore = LocalStore(_sharedPreferences);
    _client = Client();
    _baseUrl = "http://localhost:3000";
    _api = FakeRestaurantApi(50);
  }

  static Widget composeAuthUi() {
    IAuthApi _api = AuthApi(_baseUrl, _client);
    AuthManager _manger = AuthManager(_api);
    AuthCubit _authCubit = AuthCubit(_localStore);
    ISignUpService _signupService = SignUpService(_api);

    return BlocProvider(
      create: (BuildContext context) => _authCubit,
      child: AuthPage(_manger, _signupService),
    );
  }

  static Widget composeHomeUi() {
    RestaurantCubit _restaurantCubit =
        RestaurantCubit(_api, defaultPageSize: 20);
    IHomePageAdapter adapter = HomePageAdapter(
        onSearch: _composeSearchResultsPageWith,
        onSelection: _composeRestaurantPageWith);

    return MultiBlocProvider(providers: [
      BlocProvider<RestaurantCubit>(
        create: (BuildContext context) => _restaurantCubit,
      ),
      BlocProvider<HeaderCubit>(
        create: (BuildContext context) => HeaderCubit(),
      )
    ], child: RestaurantListPage(adapter));
  }

  static Widget _composeSearchResultsPageWith(String query) {
    RestaurantCubit restaurantCubit =
        RestaurantCubit(_api, defaultPageSize: 10);
    ISearchResultsPageAdapter searchResultsPageAdapter =
        SearchResultsPageAdapter(onSelection: _composeRestaurantPageWith);
    return SearchResultsPage(restaurantCubit, query, searchResultsPageAdapter);
  }

  static Widget _composeRestaurantPageWith(Restaurant restaurant) {
    RestaurantCubit restaurantCubit =
        RestaurantCubit(_api, defaultPageSize: 10);
    return RestaurantPage(restaurant, restaurantCubit);
  }
}
